import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> items = [
    "Hola ",
    "Hola ",
    "Hola ",
    "Hola ",
    "Hola ",
  ];

  void updateList(String value) {
    setState(() {
      items.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: getList(),
    );
  }

  ListView getList() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return getFila(index);
      },
    );
  }

  Widget getFila(int index) {
    return Row(
      children: [
        Icon(Icons.star),
        SizedBox(width: 8),
        Text('${items[index]} ${index}'),
      ],
    );
  }
}
