import 'package:flutter/material.dart';
import 'package:flutter_tutorial/GoogleMapScreen.dart';
import 'package:flutter_tutorial/MapScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> data = [];

  void goMap() {
    Navigator.push(
      context,
      //MaterialPageRoute(builder: (context) => MapScreen()),
      MaterialPageRoute(builder: (context) => GoogleMapScreen()),
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
              onPressed: goMap,
              child: const Text('Simple API'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
