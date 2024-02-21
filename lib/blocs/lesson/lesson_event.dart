part of 'lesson_bloc.dart';

sealed class LessonEvent extends Equatable {
  const LessonEvent();

  @override
  List<Lesson> get props => [];
}

final class GetAllLesson extends LessonEvent {}

final class GetLessonOfClass extends LessonEvent {
  final ClassModel classModel;
  const GetLessonOfClass({required this.classModel});
}

final class GetLessonOfNullClass extends LessonEvent {}

final class AddLesson extends LessonEvent {
  final Lesson lesson;
  const AddLesson({required this.lesson});

  @override
  List<Lesson> get props => [lesson];
}

final class DeleteLesson extends LessonEvent {
  final Lesson lesson;
  const DeleteLesson({required this.lesson});

  @override
  List<Lesson> get props => [lesson];
}
