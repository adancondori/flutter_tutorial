import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Api1.dart';
import 'package:flutter_tutorial/DetailPokemon.dart';
import 'package:flutter_tutorial/PokemonList.dart';
import 'package:flutter_tutorial/SimpleApi2.dart';
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

  void goSimpleAPI() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SimpleAPI2()),
    );
  }

  void goSimpleListPokemon() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PokemonList()),
    );
  }

  void goDetailPokemon() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPokemon()),
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
              onPressed: goSimpleAPI,
              child: const Text('Simple API'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: goSimpleListPokemon,
              child: const Text('Simple API Pokemon'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: goDetailPokemon,
              child: const Text('Details API Pokemon'),
            ),
          ],
        ),
      ),
    );
  }
}
