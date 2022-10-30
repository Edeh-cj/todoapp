import 'package:flutter/material.dart';

class TodoNotifier extends ChangeNotifier{
  final List<String> _list = [];
  List<String> get todoList=> _list;

  addTodo(String text){
    _list.insert(0, text);
    notifyListeners();
  }
  deleteTodo(int index){
    _list.removeAt(index);
    notifyListeners();
  }

}