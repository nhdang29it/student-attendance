import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_student_attendance/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_student_attendance/image_links.dart';
import 'package:flutter_student_attendance/models/class_model.dart';
import 'package:flutter_student_attendance/models/lesson_model.dart';
import 'package:flutter_student_attendance/views/components/appbar_widget.dart';
import 'package:flutter_student_attendance/views/components/leading_appbar_icon.dart';
import 'package:flutter_student_attendance/views/pages/lesson_scanning.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({required this.classModel, super.key});

  final ClassModel classModel;

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Row _buildRowHeadListView() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Lop: "),
          Text(widget.classModel.className),
        ],
      );

  @override
  void initState() {
    super.initState();
    context
        .read<LessonBloc>()
        .add(GetLessonOfClass(classModel: widget.classModel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final String now = DateTime.now().toIso8601String();
          final Lesson newLesson = Lesson(
              name: "chuong 1",
              teacherName: "dang",
              createDate: now,
              attendanceDate: now,
              classModel: widget.classModel);
          context.read<LessonBloc>().add(AddLesson(lesson: newLesson));
        },
        tooltip: "Add new lesson",
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            text: "Scanning Student",
            imagePath: appBarLink,
            leading: buildLeadingAppBarIcon(() {
              Navigator.pop(context);
            }),
          ),
          SliverToBoxAdapter(
            child: _buildRowHeadListView(),
          ),
          BlocBuilder<LessonBloc, LessonState>(
            builder: (context, state) {
              final lessons = state.props;
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
                    title: Text("${lessons[index].classModel?.className}"),
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
