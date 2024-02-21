import 'package:flutter_student_attendance/models/class_model.dart';
import 'package:flutter_student_attendance/models/lesson_model.dart';
import 'package:sqflite/sqflite.dart';

import 'sqlite_db_helper.dart';

class LessonTable {
  SqliteDBHelper sqliteDBHelper = SqliteDBHelper.instance;
  final String table = "lesson";

  Future<int> insert(Lesson data) async {
    Database db = await sqliteDBHelper.database;
    return db.insert(table, data.toDB(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<int> deleteLesson(Lesson lesson) async {
    Database db = await sqliteDBHelper.database;
    return db.delete(table, where: "L_Id = ?", whereArgs: [lesson.id]);
  }

  Future<List<Lesson>> getAllLesson() async {
    Database db = await sqliteDBHelper.database;
    final result = await db.rawQuery(
        "SELECT * FROM lesson l LEFT JOIN class c on l.L_C_classId = c.C_classId");

    return result.map((e) {
      if (e["L_C_classId"] == null) {
        // e['classModel'] = null;
        return Lesson.fromJson(e);
      } else {
        ClassModel classModel = ClassModel.fromDB(e);
        return Lesson.fromDB(e, classModel);
      }
    }).toList();
  }

  Future<List<Lesson>> getAllLessonOfClass(ClassModel classModel) async {
    Database db = await sqliteDBHelper.database;
    final result = await db.query(table,
        where: "L_C_classId = ?", whereArgs: [classModel.classId]);

    return result.map((e) => Lesson.fromDB(e, classModel)).toList();
  }

  Future<List<Lesson>> getAllLessonOfNullClass() async {
    Database db = await sqliteDBHelper.database;
    final result = await db.query(table, where: "L_C_classId is NULL");

    return result.map((e) => Lesson.fromJson(e)).toList();
  }
}
