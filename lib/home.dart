import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ApiService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final apiService = ApiService();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> connectApi() async {
    //Future<List<Map<String, dynamic>>> list = apiService.fetchUsers();
    final String apiUrl = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(apiUrl));
    List<dynamic> data = json.decode(response.body);

    for (final user in data) {
      print(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(onPressed: null, child: const Text('Outlined')),
            ElevatedButton.icon(
                onPressed: () {
                  connectApi();
                },
                icon: const Icon(Icons.api),
                label: const Text('Photo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
