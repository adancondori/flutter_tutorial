import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/pokemon/bloc/pokemon_bloc.dart';
import 'package:flutter_tutorial/pokemon/bloc/pokemon_event.dart';
import 'package:flutter_tutorial/pokemon/bloc/pokemon_state.dart';

class HomePokemon extends StatefulWidget {
  const HomePokemon({super.key});

  @override
  State<HomePokemon> createState() => _HomePokemonPageState();
}

class _HomePokemonPageState extends State<HomePokemon> {
  @override
  Widget build(BuildContext context) {
    //final pokemonBloc = BlocProvider.of<PokemonBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('API Example'),
      ),
      body: BlocListener<PokemonBloc, PokemonStates>(
        listener: (context, state) {
          //if (state is UpdateState) {}
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("NO se")));
        },
        child: BlocBuilder<PokemonBloc, PokemonStates>(
          builder: (context, state) {
            if (state is InitialState) {
              final loginBloc = BlocProvider.of<PokemonBloc>(context);
              loginBloc.add(ApiPokemonEvent());
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UpdateState) {
              return getDetail(state.data);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Center getDetail(List<dynamic> data) {
    var bodyDetail = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //ElevatedButton(
          //  onPressed: fetchData,
          //  child: const Text('Cargar Datos desde la API'),
          //),
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
    );
    return bodyDetail;
  }
}
