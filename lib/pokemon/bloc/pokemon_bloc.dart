import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/pokemon/bloc/pokemon_event.dart';
import 'package:flutter_tutorial/pokemon/bloc/pokemon_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PokemonBloc extends Bloc<PokemonEvents, PokemonStates> {
  List<dynamic> data = [];

  PokemonBloc() : super(InitialState()) {
    on<ApiPokemonEvent>(onApiPokemon);
  }

  void onApiPokemon(ApiPokemonEvent event, Emitter<PokemonStates> emit) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/Pokemons'));

    if (response.statusCode == 200) {
      data = convert.jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
    emit(UpdateState(data));
  }
}
