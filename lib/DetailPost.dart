import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DetailPost extends StatefulWidget {
  const DetailPost({super.key});

  @override
  State<DetailPost> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPost> {
  int userId = 0;
  int id = 0;
  String title = "";
  String body = "";

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);

      setState(() {
        userId = data['userId'];
        id = data['id'];
        title = data['title'];
        body = data['body'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void goScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPost()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ID: $id',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'UserID: $userId',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Titulo: $title',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Cuerpo: $body',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
