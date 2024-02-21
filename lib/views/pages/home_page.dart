import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_student_attendance/blocs/class/class_bloc.dart';
import 'package:flutter_student_attendance/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_student_attendance/models/class_model.dart';
import 'package:flutter_student_attendance/views/components/action_grid_card.dart';
import 'package:flutter_student_attendance/views/components/appbar_widget.dart';
import 'package:flutter_student_attendance/views/components/footer_sliver.dart';
import 'package:flutter_student_attendance/views/components/list_class_dialog.dart';
import 'package:flutter_student_attendance/views/pages/class_management_page.dart';
import 'package:flutter_student_attendance/views/pages/other_scanning.dart';
import 'package:flutter_student_attendance/views/pages/scan_page.dart';
import '../../image_links.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ClassBloc>().add(GetListClassEvent());
    context.read<LessonBloc>().add(GetAllLesson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 245, 250),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ClassBloc>().add(GetListClassEvent());
          context.read<LessonBloc>().add(GetAllLesson());
        },
        child: const Icon(Icons.refresh),
      ),
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(
              text: "Student Scanned",
              centerTitle: true,
              imagePath: appBarLink),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverGrid(
            delegate: SliverChildListDelegate([
              BlocBuilder<ClassBloc, ClassState>(
                builder: (context, state) {
                  return ActionGridCard(
                    title: 'Class management',
                    description: "Quantity: ${state.props.length.toString()}",
                    color: const Color.fromARGB(236, 143, 237, 191),
                    icon: Icons.school_outlined,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ClassManagementPage()));
                    },
                  );
                },
              ),
              BlocBuilder<ClassBloc, ClassState>(
                  builder: (context, classState) {
                return ActionGridCard(
                  title: 'Class Scanning',
                  color: const Color.fromARGB(230, 132, 232, 236),
                  icon: Icons.qr_code_scanner_rounded,
                  onTap: () {
                    showDialog<ClassModel?>(
                        context: context,
                        builder: (context) {
                          return ListClassDialog(listClass: classState.props);
                        }).then((result) {
                      if (result != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScanPage(
                                  classModel: result,
                                )));
                      }
                    });
                  },
                );
              }),
              BlocBuilder<LessonBloc, LessonState>(
                builder: (context, state) {
                  return ActionGridCard(
                    title: 'Other Scanning',
                    color: const Color.fromARGB(218, 98, 153, 248),
                    description: state.props
                        .where((element) => element.classModel == null)
                        .toList()
                        .length
                        .toString(),
                    icon: Icons.qr_code_rounded,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtherScanning()));
                    },
                  );
                },
              ),
            ]),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 1.5,
            ),
          ),
          const SliverFooter(content: [
            TextSpan(text: "Made by", style: TextStyle(color: Colors.black)),
            TextSpan(
                text: " haidang.it",
                style: TextStyle(color: Color.fromARGB(255, 2, 186, 167))),
            TextSpan(text: " ❤", style: TextStyle(color: Colors.red))
          ])
        ],
      ),
    );
  }
}
