import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_object.dart';
import 'package:todo_app/services/db_service.dart';

class TodoItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final todoItem = Provider.of<TodoObject>(context);
    return Card(child: ListTile(
      leading: CircleAvatar(child: Text("1"),),
      title: Text(todoItem.title),
      subtitle: Text(todoItem.description),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (){
          Provider.of<DBService>(context, listen: false).deleteTodo(todoItem.key);
        },
      ),
    ),);
  }
}
