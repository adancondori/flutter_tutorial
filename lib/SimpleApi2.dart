import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class SimpleAPI2 extends StatefulWidget {
  const SimpleAPI2({super.key});

  @override
  State<SimpleAPI2> createState() => _SimpleAPI2PageState();
}

class _SimpleAPI2PageState extends State<SimpleAPI2> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      setState(() {
        data = convert.jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Cargar Datos desde la API'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(data[index]['title']),
                    subtitle: Text(data[index]['body']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
