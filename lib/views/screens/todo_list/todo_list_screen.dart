//Framework Imports
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todolist/models/tiles/todo_tile_model.dart';

//Project Imports
import 'package:todolist/views/views.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  Future<List<ToDoTileModel>> todoList = getTasks();

  static Future<List<ToDoTileModel>> getTasks() async {
    const String url = 'https://jsonplaceholder.typicode.com/todos';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    // print(body);
    return body.map<ToDoTileModel>(ToDoTileModel.fromJson).toList();
  }

  late List<ToDoTileModel> toDoTileModels;

  //Text Editing Controller
  TextEditingController textContoller = TextEditingController();

  void checkBoxCheckChanged(bool? value, int index) {
    setState(() {
      toDoTileModels[index].isCompleted = !toDoTileModels[index].isCompleted;
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialogBox(
            textContoller: textContoller,
            onSave: onSave,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //Saves new task
  void onSave() {
    setState(() {
      final todoListLength = toDoTileModels.length;
      final ToDoTileModel newTask = ToDoTileModel(
          userId: toDoTileModels[0].userId,
          id: todoListLength + 1,
          titleName: textContoller.text,
          isCompleted: false);
      toDoTileModels.add(newTask);
      textContoller.clear();
    });
    Navigator.of(context).pop();
  }

  //Deletes the task
  void deleteTask(int index) {
    setState(() {
      // ignore: list_remove_unrelated_type
      toDoTileModels.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: FutureBuilder<List<ToDoTileModel>>(
        future: todoList,
        builder: (context, snapshot) {
          final data = snapshot;
          if (data.hasData) {
            toDoTileModels = data.data!;
            return buildTodoList(toDoTileModels);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTodoList(List<ToDoTileModel> tasks) => ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final tile = tasks[index];
        return ToDoTile(
          userId: tile.userId,
          id: tile.id,
          titleName: tile.titleName,
          isCompleted: tile.isCompleted,
          onChanged: (value) => checkBoxCheckChanged(value, index),
          deleteTask: (context) {
            //deleteTask(index);
          },
        );
      });
}
