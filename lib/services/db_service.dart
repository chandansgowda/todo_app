import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/providers/todo_object.dart';

class DBService extends ChangeNotifier{

  List<TodoObject> _todos = [TodoObject("HJbjsbc", "asjhfbiia iuhih iuhu uh")];

  List<TodoObject> get todos {
    return [..._todos];
  }

  void getTodos() {
   Box todoBox = Hive.box(kTodoBox);
   _todos = todoBox.values.toList().cast<TodoObject>();
  }

  void addTodo(TodoObject todo) {
    Box todoBox = Hive.box(kTodoBox);
    todoBox.add(todo);
    notifyListeners();
  }

  void deleteTodo(int todoKey){
    Box todoBox = Hive.box(kTodoBox);
    todoBox.delete(todoKey);
    notifyListeners();
  }
}