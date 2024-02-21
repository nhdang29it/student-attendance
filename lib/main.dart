import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_student_attendance/blocs/class/class_bloc.dart';
import 'package:flutter_student_attendance/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_student_attendance/views/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClassBloc>(create: (context) => ClassBloc()),
        BlocProvider<LessonBloc>(create: (context) => LessonBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(0, 235, 32, 154)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
