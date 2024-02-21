import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_student_attendance/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_student_attendance/image_links.dart';
import 'package:flutter_student_attendance/models/lesson_model.dart';
import 'package:flutter_student_attendance/views/components/appbar_widget.dart';
import 'package:flutter_student_attendance/views/components/leading_appbar_icon.dart';
import 'package:flutter_student_attendance/views/pages/lesson_scanning.dart';

class OtherScanning extends StatefulWidget {
  const OtherScanning({super.key});

  @override
  State<OtherScanning> createState() => _OtherScanningState();
}

class _OtherScanningState extends State<OtherScanning> {
  @override
  void initState() {
    super.initState();
    context.read<LessonBloc>().add(GetLessonOfNullClass());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final String now = DateTime.now().toIso8601String();
          final Lesson newLesson = Lesson(
            name: "lao dong tuan 12",
            teacherName: "dang",
            createDate: now,
            attendanceDate: now,
          );
          context.read<LessonBloc>().add(AddLesson(lesson: newLesson));
        },
        tooltip: "Add new attendance",
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            text: "Other Scanning",
            imagePath: appBarLink,
            leading: buildLeadingAppBarIcon(() {
              Navigator.pop(context);
            }),
          ),
          BlocBuilder<LessonBloc, LessonState>(
            builder: (context, state) {
              final lessons = state.props
                  .where((element) => element.classModel == null)
                  .toList();

              if (lessons.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text("empty"),
                  ),
                );
              }
              return SliverList.builder(
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${lessons[index].id}. ${lessons[index].name}"),
                    subtitle: Text(
                      lessons[index].createDate,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<LessonBloc>()
                              .add(DeleteLesson(lesson: lessons[index]));
                        },
                        icon: const Icon(Icons.delete)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LessonScanning()));
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
