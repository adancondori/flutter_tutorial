import 'package:flutter/material.dart';
import 'package:flutter_tutorial/home/bloc/counter_bloc.dart';
import 'package:flutter_tutorial/home/bloc/counter_event.dart';
import 'package:flutter_tutorial/home/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/pokemon/ui/home_pokemon.dart';
import 'package:flutter_tutorial/posts/ui/home_posts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void goNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePosts()),
    );
  }

  void goNextPokemon() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePokemon()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bloc Demo APP"),
      ),
      body: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          if (state is InitialState) {
            return _counter(context, 0);
          }
          if (state is UpdateState) {
            return _counter(context, state.counter);
          }
          return Container();
        },
      ),
    );
  }

  Widget _counter(BuildContext context, int counter) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.red,
                elevation: 0.0,
                height: 50,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "-",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                onPressed: () {
                  context.read<CounterBloc>().add(NumberDecreaseEvent());
                },
              ),
              const SizedBox(
                width: 50,
              ),
              MaterialButton(
                color: Colors.green,
                elevation: 0.0,
                height: 50,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "+",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                onPressed: () {
                  context.read<CounterBloc>().add(NumberIncreaseEvent());
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: const Color.fromARGB(255, 11, 32, 223),
            elevation: 0.0,
            height: 50,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Text(
              "Next Screen",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            onPressed: () {
              goNextScreen();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: const Color.fromARGB(255, 11, 32, 223),
            elevation: 0.0,
            height: 50,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Text(
              "Next Screen",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            onPressed: () {
              goNextPokemon();
            },
          )
        ],
      ),
    );
  }
}
