import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/models/models.dart';

abstract class ToDoListRepository {
  Future<List<ToDoTileModel>> fetchTasksList();
}

class ToDoListRepositoryImplementation extends ToDoListRepository {
  @override
  Future<List<ToDoTileModel>> fetchTasksList() async {
    const String url = 'https://jsonplaceholder.typicode.com/todos';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body.map<ToDoTileModel>(ToDoTileModel.fromJson).toList();
    }

    throw Exception('Failed to load tasks');
  }
}
