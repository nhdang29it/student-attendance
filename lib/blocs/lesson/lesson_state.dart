part of 'lesson_bloc.dart';

sealed class LessonState extends Equatable {
  const LessonState();

  @override
  List<Lesson> get props => [];
}

final class LessonInitial extends LessonState {}

final class LoadingLessonState extends LessonState {
  final List<Lesson> listLesson;
  const LoadingLessonState({required this.listLesson});

  @override
  List<Lesson> get props => listLesson;
}

final class LoadedLessonState extends LessonState {
  final List<Lesson> listLesson;
  const LoadedLessonState({required this.listLesson});

  @override
  List<Lesson> get props => listLesson;
}

final class LoadErrorLessonState extends LessonState {
  final List<Lesson> listLesson;
  final String err;
  const LoadErrorLessonState({required this.listLesson, required this.err});

  @override
  List<Lesson> get props => listLesson;
}
