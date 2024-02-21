part of 'class_bloc.dart';

sealed class ClassState extends Equatable {
  const ClassState();

  @override
  List<ClassModel> get props => [];
}

final class ClassInitial extends ClassState {}

final class LoadingClassState extends ClassState {
  final List<ClassModel> listClass;
  const LoadingClassState(this.listClass);

  @override
  List<ClassModel> get props => listClass;
}

final class LoadedClassState extends ClassState {
  final List<ClassModel> listClass;
  const LoadedClassState(this.listClass);

  @override
  List<ClassModel> get props => listClass;
}

final class LoadErrorClassState extends ClassState {
  final String err;
  final List<ClassModel> listClass;
  const LoadErrorClassState({required this.listClass, required this.err});

  @override
  List<ClassModel> get props => listClass;
}
