import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      for (final user in data) {
        print(user);
      }
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
