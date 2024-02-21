import 'package:flutter_student_attendance/models/lesson_model.dart';
import 'package:flutter_student_attendance/models/student_model.dart';

class Attendance {
  final Lesson lesson;
  final Student student;

  Attendance({
    required this.lesson,
    required this.student,
  });

  Attendance copyWith({
    Lesson? lesson,
    Student? student,
  }) =>
      Attendance(
        lesson: lesson ?? this.lesson,
        student: student ?? this.student,
      );

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        lesson: Lesson.fromJson(json["lesson"]),
        student: Student.fromJson(json["student"]),
      );

  Map<String, dynamic> toJson() => {
        "lessonId": lesson.toJson(),
        "studentMssv": student.toJson(),
      };
}
