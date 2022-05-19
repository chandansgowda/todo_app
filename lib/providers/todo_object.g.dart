// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoObjectAdapter extends TypeAdapter<TodoObject> {
  @override
  final int typeId = 0;

  @override
  TodoObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoObject(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TodoObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
