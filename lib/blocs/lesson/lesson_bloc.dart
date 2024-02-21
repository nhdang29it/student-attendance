import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_student_attendance/models/class_model.dart';
import 'package:flutter_student_attendance/models/lesson_model.dart';
import 'package:flutter_student_attendance/repositories/databases/lesson_table.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonTable lessonTable = LessonTable();
  LessonBloc() : super(LessonInitial()) {
    on<GetLessonOfClass>(_getLessonOfClass);
    on<GetLessonOfNullClass>(_getLessonOfNullClass);
    on<GetAllLesson>(_getAllLesson);
    on<AddLesson>(_addLesson);
    on<DeleteLesson>(_deleteLesson);
  }

  FutureOr<void> _getLessonOfClass(
      GetLessonOfClass event, Emitter<LessonState> emit) async {
    emit.call(LoadingLessonState(listLesson: state.props));
    final List<Lesson> result =
        await lessonTable.getAllLessonOfClass(event.classModel);
    emit.call(LoadedLessonState(listLesson: result));
  }

  FutureOr<void> _addLesson(AddLesson event, Emitter<LessonState> emit) async {
    Lesson lesson = event.lesson;
    int result = await lessonTable.insert(lesson);
    if (result > 0) {
      emit.call(LoadedLessonState(listLesson: [...state.props, lesson]));
    }
  }

  FutureOr<void> _getLessonOfNullClass(
      GetLessonOfNullClass event, Emitter<LessonState> emit) async {
    emit.call(const LoadingLessonState(listLesson: []));
    final List<Lesson> result = await lessonTable.getAllLessonOfNullClass();
    emit.call(LoadedLessonState(listLesson: result));
  }

  FutureOr<void> _deleteLesson(
      DeleteLesson event, Emitter<LessonState> emit) async {
    Lesson lesson = event.lesson;
    int result = await lessonTable.deleteLesson(lesson);
    if (result > 0) {
      emit.call(LoadedLessonState(
        listLesson: state.props.where((element) => element != lesson).toList(),
      ));
    }
  }

  FutureOr<void> _getAllLesson(
      GetAllLesson event, Emitter<LessonState> emit) async {
    emit.call(const LoadingLessonState(listLesson: []));
    final List<Lesson> result = await lessonTable.getAllLesson();
    emit.call(LoadedLessonState(listLesson: result));
  }
}
