import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/providers/todo_object.dart';
import 'package:todo_app/screens/add_todo_screen.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/services/db_service.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoObjectAdapter());
  await Hive.openBox(kTodoBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => DBService(),
      child: MaterialApp(
        title: "TODO",
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.deepPurpleAccent,
          appBarTheme: AppBarTheme(color: Colors.deepPurpleAccent),
          floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(backgroundColor: Colors.purple)
        ),
        initialRoute: "/",
        routes: {
          "/": (ctx) => HomeScreen(),
          AddTodoScreen.routeName: (ctx) => AddTodoScreen()
        },
      ),
    );
  }
}
