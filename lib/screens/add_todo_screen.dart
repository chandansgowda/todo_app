import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_object.dart';
import 'package:todo_app/services/db_service.dart';

class AddTodoScreen extends StatelessWidget {
  static const routeName = "/add-todo";

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration:
                  InputDecoration(label: Text("Title"), icon: Icon(Icons.title)),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  label: Text("Description"), icon: Icon(Icons.description)),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () {
                  TodoObject newTodo = TodoObject(
                      _titleController.value.text.toString(),
                      _descriptionController.value.text.toString());
                  Provider.of<DBService>(context, listen: false).addTodo(newTodo);
                  Navigator.of(context).pop();
                },
                child: Text("Add Todo"),
              style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor)
            )
          ],
        ),
      ),
    );
  }
}
