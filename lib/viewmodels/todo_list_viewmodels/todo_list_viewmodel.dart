import 'package:flutter/material.dart';
import 'package:todolist/models/models.dart';

import 'package:todolist/repositories/repositories.dart';

abstract class ViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> fetchToDoListData();
}

class ToDoListViewModel extends ViewModel {
  late final ToDoListRepository repo;

  List<ToDoTileModel> get toDoTileModel => _toDoTileModel;

  set setToDoTileModel(List<ToDoTileModel> toDoTileModel) {
    _toDoTileModel = toDoTileModel;
    notifyListeners();
  }

  @override
  Future<List<ToDoTileModel>> fetchToDoListData() async {
    try {
      isLoading = true;
      var response = await repo.fetchTasksList();
      // setToDoTileModel(response as List<ToDoTileModel>);

      isLoading = false;
      notifyListeners();
      return response;
    } catch (exec) {
      print('Error in fetchToDoListData: ${exec.toString()}');
      rethrow;
    }
  }

  //INTERNALS
  late List<ToDoTileModel> _toDoTileModel;
}
