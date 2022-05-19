import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_object.dart';
import 'package:todo_app/screens/add_todo_screen.dart';
import 'package:todo_app/services/db_service.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Provider.of<DBService>(context, listen: false).getTodos();
    final todosDB = Provider.of<DBService>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/3,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              color: Theme.of(context).primaryColor
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/1.8,
            child: ListView.builder(itemBuilder: (ctx,i){
              return ChangeNotifierProvider.value(value: todosDB.todos[i],
              child: TodoItem(i+1));
            }, itemCount: todosDB.todos.length,),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed(AddTodoScreen.routeName);
      }, child: Icon(Icons.add),),
    );
  }
}
