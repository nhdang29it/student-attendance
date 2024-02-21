import 'package:flutter_student_attendance/models/class_model.dart';
import 'package:flutter_student_attendance/models/student_model.dart';

class StudentInClass {
  final ClassModel classModel;
  final Student student;

  StudentInClass({
    required this.classModel,
    required this.student,
  });

  StudentInClass copyWith({
    ClassModel? classModel,
    Student? student,
  }) =>
      StudentInClass(
        classModel: classModel ?? this.classModel,
        student: student ?? this.student,
      );

  factory StudentInClass.fromJson(Map<String, dynamic> json) => StudentInClass(
        classModel: ClassModel.fromJson(json["classModel"]),
        student: Student.fromJson(json["student"]),
      );

  Map<String, dynamic> toJson() => {
        "classModel": classModel.toJson(),
        "student": student.toJson(),
      };
}
