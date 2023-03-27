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
  // ToDoListViewModel(this.repo, {});
  late final ToDoListRepository repo;

  List<ToDoTileModel> get toDoTileModel => _toDoTileModel;

  set toDoTileModel(List<ToDoTileModel> toDoTileModel) {
    _toDoTileModel = toDoTileModel;
    notifyListeners();
  }

  @override
  Future<void> fetchToDoListData() async {
    try {
      isLoading = true;
      _toDoTileModel = await repo.fetchTasksList();
    } catch (exec) {
      print('Error in fetchToDoListData: ${exec.toString()}');
    }
    isLoading = false;
    notifyListeners();
  }

  //INTERNALS
  late List<ToDoTileModel> _toDoTileModel;
}
