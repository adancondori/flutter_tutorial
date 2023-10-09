import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screen.dart';
import 'task_list.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3];
    var bodyWidget = Column(
      children: <Widget>[
        TextField(
          controller: taskController,
          decoration: const InputDecoration(
            labelText: 'Nueva tarea',
          ),
        ),
        SizedBox(
          height: 20.0,
          child: Container(),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              tasks.add(taskController.text);
              taskController.clear();
            });
          },
          child: const Text('Agregar tarea'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Pantalla()),
            );
          },
          child: const Text('Go Pantalla'),
        ),
        Expanded(
          child: TaskList(tasks),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: bodyWidget,
    );
  }
}
