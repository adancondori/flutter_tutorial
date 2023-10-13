import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DetailPokemon extends StatefulWidget {
  @override
  _DetailPokemonState createState() => _DetailPokemonState();
}

class _DetailPokemonState extends State<DetailPokemon> {
  String name = '';
  String ability1 = '';
  String ability2 =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/132.png';

  Future<void> fetchPokemonDetail() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu/'));

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);

      setState(() {
        name = data['name'];
        ability1 = data['abilities'][0]['ability']['name'];
        //ability2 = data['abilities'][1]['ability']['name'];
        ability2 = data['sprites']['other']['home']['front_shiny'];
      });
    } else {
      throw Exception('Failed to load Pokémon detail');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPokemonDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nombre: $name',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Habilidad 1: $ability1',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Habilidad 2: $ability2',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Image.network(ability2),
          ],
        ),
      ),
    );
  }
}
