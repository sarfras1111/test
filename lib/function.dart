import 'package:figma/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<studentmodel>> valueNotifier = ValueNotifier([]);

final dbName = 'studentDB';

Future<void> addStudent(studentmodel data) async {
  final db = await Hive.openBox<studentmodel>(dbName);
  final id = await db.add(data);
  data.id = id;
  valueNotifier.value.add(data);
  valueNotifier.notifyListeners();
}



Future<void> getData() async {
  final db = await Hive.openBox<studentmodel>(dbName);
  valueNotifier.value.clear();
  valueNotifier.value.addAll(db.values);
  valueNotifier.notifyListeners();
}
Future<void>editstudent(int index, studentmodel data)async{
  final db = await Hive.openBox<studentmodel>(dbName);
  db.put(index, data);
  getData();
}
Future<void>deletestudent(int index)async{
  final db = await Hive.openBox<studentmodel>(dbName);
  db.delete(index);
  getData();
}



