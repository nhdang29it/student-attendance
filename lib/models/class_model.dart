import 'package:flutter_student_attendance/models/lesson_model.dart';

class ClassModel {
  final String classId;
  final String className;
  final int semester;
  final int year;
  final int numberOfStudent;
  final List<Lesson> lessons;

  ClassModel(
      {classId,
      required this.className,
      required this.semester,
      required this.year,
      required this.numberOfStudent,
      required this.lessons})
      : classId = classId ?? "$className$semester$year";

  ClassModel copyWith(
          {String? className,
          int? semester,
          int? year,
          int? numberOfStudent,
          List<Lesson>? lessons}) =>
      ClassModel(
          className: className ?? this.className,
          semester: semester ?? this.semester,
          year: year ?? this.year,
          numberOfStudent: numberOfStudent ?? this.numberOfStudent,
          lessons: lessons ?? this.lessons);

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
      classId: json["C_classId"],
      className: json["C_className"],
      semester: json["C_semester"],
      year: json["C_year"],
      numberOfStudent: json["C_numberOfStudent"],
      lessons: json["lessons"]);

  Map<String, dynamic> toJson() => {
        "C_classId": classId,
        "C_className": className,
        "C_semester": semester,
        "C_year": year,
        "C_numberOfStudent": numberOfStudent,
        "lessons": lessons
      };

  Map<String, dynamic> toDB() => {
        "C_classId": classId,
        "C_className": className,
        "C_semester": semester,
        "C_year": year,
        "C_numberOfStudent": numberOfStudent
      };
  factory ClassModel.fromDB(Map<String, dynamic> json) => ClassModel(
      classId: json["C_Id"],
      className: json["C_className"],
      semester: json["C_semester"],
      year: json["C_year"],
      numberOfStudent: json["C_numberOfStudent"],
      lessons: []);
}
