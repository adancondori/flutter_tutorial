import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<String> tasks;

  const TaskList(this.tasks, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index]),
        );
      },
    );
  }

  Widget getDetail(int index, String name) {
    final title = Container(
      margin: const EdgeInsets.only(
        top: 5,
        left: 10,
      ),
      child: Text(
        "$index :",
        style: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
      ),
    );
    final detail = Container(
      margin: const EdgeInsets.only(top: 0, left: 10, bottom: 25),
      child: Text(
        name,
        style: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        detail,
      ],
    );
    return info;
  }
}
