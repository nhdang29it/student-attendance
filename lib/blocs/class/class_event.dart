part of 'class_bloc.dart';

sealed class ClassEvent extends Equatable {
  const ClassEvent();

  @override
  List<ClassModel> get props => [];
}

final class GetListClassEvent extends ClassEvent {}

final class AddNewClassEvent extends ClassEvent {
  final ClassModel classModel;
  const AddNewClassEvent({required this.classModel});
}

final class DeleteClassEvent extends ClassEvent {
  final ClassModel classModel;
  const DeleteClassEvent({required this.classModel});
}
