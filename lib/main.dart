import 'package:flutter/material.dart';
import 'package:flutter_tutorial/home/ui/Home.dart';
import 'package:flutter_tutorial/home/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/pokemon/bloc/pokemon_bloc.dart';
import 'package:flutter_tutorial/posts/bloc/post_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //@override
  //Widget build(BuildContext context) {
  //  return BlocProvider<CounterBloc>(
  //    create: (context) => CounterBloc(),
  //    child: MaterialApp(
  //      title: 'Flutter Demo',
  //      theme: ThemeData(
  //        primarySwatch: Colors.blue,
  //      ),
  //      home: const MyHomePage(
  //        title: "Bloc Demo APP",
  //      ),
  //    ),
  //  );
  //}

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(
          title: "Bloc Demo APP",
        ),
      ),
    );
  }
}
