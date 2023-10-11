import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  List<String> pokemonNames = [];

  Future<void> fetchPokemonList() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final results = data['results'];

      for (var result in results) {
        pokemonNames.add(result['name']);
      }
      setState(() {
        pokemonNames;
      });
    } else {
      throw Exception('Failed to load Pokémon list');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon List'),
      ),
      body: Center(
        child: pokemonNames.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: pokemonNames.length,
                itemBuilder: (context, index) {
                  return getBody(index);
                },
              ),
      ),
    );
  }

  ListTile getBody(int index) {
    return ListTile(
      title: Text(pokemonNames[index].capitalizeFirstLetter()),
    );
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
