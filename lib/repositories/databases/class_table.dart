import 'package:flutter_student_attendance/models/class_model.dart';
import 'package:sqflite/sqflite.dart';

import 'sqlite_db_helper.dart';

class ClassTable {
  SqliteDBHelper sqliteDBHelper = SqliteDBHelper.instance;
  final String table = "class";

  Future<int> insert(ClassModel data) async {
    Database db = await sqliteDBHelper.database;
    return db.insert(table, data.toDB(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<ClassModel>> getAllClass() async {
    Database db = await sqliteDBHelper.database;
    final result = await db.query(table);
    return result.map((e) => ClassModel.fromDB(e)).toList();
  }

  Future<List<ClassModel>> getClassById(ClassModel classModel) async {
    Database db = await sqliteDBHelper.database;
    final listMapClass = await db
        .query(table, where: "C_Id = ?", whereArgs: [classModel.classId]);
    if (listMapClass.isNotEmpty) {
      return listMapClass.map((e) => ClassModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<int> delete(ClassModel classModel) async {
    Database db = await sqliteDBHelper.database;
    return db
        .delete(table, where: "C_classId = ?", whereArgs: [classModel.classId]);
  }
}
