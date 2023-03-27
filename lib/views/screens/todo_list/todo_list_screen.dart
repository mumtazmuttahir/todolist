//Framework Imports
import 'package:flutter/material.dart';

//Project Imports
import 'package:todolist/views/views.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  //Text Editing Controller
  TextEditingController textContoller = TextEditingController();
  //List
  List todoList = [
    [1, 1, 'New Tile 1', true],
    [1, 2, 'New Tile 2', false],
    [1, 3, 'New Tile 3', true]
  ];

  void checkBoxCheckChanged(bool? value, int index) {
    setState(() {
      todoList[index][3] = !todoList[index][3];
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
      final todoListLength = todoList.length;
      todoList
          .add([todoList[0][0], todoListLength + 1, textContoller.text, false]);
      textContoller.clear();
    });
    Navigator.of(context).pop();
  }

  //Deletes the task
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('ToDo List'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            userId: todoList[index][0],
            id: todoList[index][1],
            titleName: todoList[index][2],
            isCompleted: todoList[index][3],
            onChanged: (value) => checkBoxCheckChanged(value, index),
            deleteTask: (context) {
              deleteTask(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
