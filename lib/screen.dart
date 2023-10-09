import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  _PantallaState createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  Future<void> getAPI() async {
    var url =
        Uri.parse('https://www.colourlovers.com/api/colors/new?format=json');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      //var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: .');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var bodyWidget = Column(
      children: <Widget>[
        Text("Hola mundo"),
        ElevatedButton(
          onPressed: () {
            getAPI();
          },
          child: const Text('Go Pantalla'),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: bodyWidget,
    );
  }
}
