import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/models/models.dart';

Future<ToDoTileModel> fetchTask() async {
  const String url = 'https://jsonplaceholder.typicode.com/todos';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return ToDoTileModel.fromJson(jsonDecode(response.body));
  }

  throw Exception('Failed to load tasks');
}
