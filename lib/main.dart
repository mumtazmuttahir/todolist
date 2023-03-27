//Framework imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/viewmodels/viewmodels.dart';
//Project imports
import 'package:todolist/views/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ToDoListViewModel())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ToDoListScreen(),
      ),
    );
  }
}
