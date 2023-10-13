import 'package:flutter/material.dart';
import 'package:flutter_tutorial/DetailPost.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SimpleAPI extends StatefulWidget {
  const SimpleAPI({super.key});

  @override
  State<SimpleAPI> createState() => _SimpleAPIPageState();
}

class _SimpleAPIPageState extends State<SimpleAPI> {
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

  void goScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPost()),
    );
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
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(data[index]['title']),
                    subtitle: Text(data[index]['body']),
                    onTap: () => goScreen(),
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
