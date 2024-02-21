import 'package:flutter_student_attendance/models/class_model.dart';

class Lesson {
  final int? id;
  final String name;
  final String teacherName;
  final String createDate;
  final String attendanceDate;
  final ClassModel? classModel;

  Lesson(
      {this.id,
      required this.name,
      required this.teacherName,
      required this.createDate,
      required this.attendanceDate,
      this.classModel});

  Lesson copyWith(
          {int? id,
          String? name,
          String? teacherName,
          String? createDate,
          String? attendanceDate,
          ClassModel? classModel}) =>
      Lesson(
          id: id ?? this.id,
          name: name ?? this.name,
          teacherName: teacherName ?? this.teacherName,
          createDate: createDate ?? this.createDate,
          attendanceDate: attendanceDate ?? this.attendanceDate,
          classModel: classModel ?? this.classModel);

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
      id: json["L_Id"],
      name: json["L_name"],
      teacherName: json["L_teacherName"],
      createDate: json["L_createDate"],
      attendanceDate: json["L_attendanceDate"],
      classModel: json["classModel"]);

  Map<String, dynamic> toJson() => {
        "L_Id": id,
        "L_name": name,
        "L_teacherName": teacherName,
        "L_createDate": createDate,
        "L_attendanceDate": attendanceDate,
        "classModel": classModel
      };

  Map<String, dynamic> toDB() => {
        "L_name": name,
        "L_teacherName": teacherName,
        "L_createDate": createDate,
        "L_attendanceDate": attendanceDate,
        "L_C_classId": classModel?.classId
      };

  factory Lesson.fromDB(Map<String, dynamic> json, ClassModel classModel) =>
      Lesson(
          id: json["L_Id"],
          name: json["L_name"],
          teacherName: json["L_teacherName"],
          createDate: json["L_createDate"],
          attendanceDate: json["L_attendanceDate"],
          classModel: classModel);
}
