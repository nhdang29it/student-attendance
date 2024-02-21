import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_student_attendance/models/class_model.dart';
import 'package:flutter_student_attendance/repositories/databases/class_table.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final ClassTable classDB = ClassTable();

  ClassBloc() : super(ClassInitial()) {
    on<GetListClassEvent>(_getListClassEvent);
    on<AddNewClassEvent>(_addNewClassEvent);
    on<DeleteClassEvent>(_deleteClassEvent);
  }

  FutureOr<void> _getListClassEvent(
      GetListClassEvent event, Emitter<ClassState> emit) async {
    emit.call(LoadingClassState(state.props));

    try {
      final List<ClassModel> resultData = await classDB.getAllClass();
      emit.call(LoadedClassState(resultData));
    } catch (e) {
      emit.call(LoadErrorClassState(listClass: state.props, err: e.toString()));
    }
  }

  FutureOr<void> _addNewClassEvent(
      AddNewClassEvent event, Emitter<ClassState> emit) async {
    emit.call(LoadingClassState(state.props));
    int result = await classDB.insert(event.classModel);
    if (result != 0) {
      emit.call(LoadedClassState([...state.props, event.classModel]));
    } else {
      emit.call(LoadErrorClassState(
          listClass: state.props, err: "Somethings went wrong!!"));
    }
  }

  FutureOr<void> _deleteClassEvent(
      DeleteClassEvent event, Emitter<ClassState> emit) async {
    emit.call(LoadingClassState(state.props));
    int result = await classDB.delete(event.classModel);
    if (result != 0) {
      emit.call(LoadedClassState(
          [...state.props.where((element) => element != event.classModel)]));
    } else {
      emit.call(LoadErrorClassState(
          listClass: state.props, err: "Somethongs went wrong!"));
    }
  }
}
