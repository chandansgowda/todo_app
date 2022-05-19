import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'todo_object.g.dart';

@HiveType(typeId: 0)
class TodoObject extends ChangeNotifier with HiveObjectMixin{

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  TodoObject(this.title, this.description);
}