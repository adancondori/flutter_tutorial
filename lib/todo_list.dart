import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: taskController,
            decoration: const InputDecoration(
              labelText: 'Nueva tarea',
            ),
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
          Expanded(
            child: TaskList(tasks),
          ),
        ],
      ),
    );
  }
}
