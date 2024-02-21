import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_student_attendance/blocs/class/class_bloc.dart';
import 'package:flutter_student_attendance/image_links.dart';
import 'package:flutter_student_attendance/models/class_model.dart';
import 'package:flutter_student_attendance/views/components/action_tile_card.dart';
import 'package:flutter_student_attendance/views/components/appbar_widget.dart';
import 'package:flutter_student_attendance/views/components/footer_sliver.dart';
import 'package:flutter_student_attendance/views/components/leading_appbar_icon.dart';
import 'package:flutter_student_attendance/views/pages/class_detail.dart';

class ClassManagementPage extends StatelessWidget {
  const ClassManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClassBloc, ClassState>(
      listener: (context, state) {
        if (state is LoadErrorClassState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.err),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog<ClassModel?>(
                context: context,
                builder: (context) {
                  String name = "";
                  int semester = 0, year = 0, nos = 0;
                  return AlertDialog(
                    title: const Text("Add new class"),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                hintText: "type name",
                                label: Text("Name of Class"),
                                border: OutlineInputBorder()),
                            onChanged: (value) => name = value,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: "type semester",
                                label: Text("semester"),
                                border: OutlineInputBorder()),
                            onChanged: (value) => semester = int.parse(value),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: "type year",
                                label: Text("year"),
                                border: OutlineInputBorder()),
                            onChanged: (value) => year = int.parse(value),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: "type number",
                                label: Text("Number of student"),
                                border: OutlineInputBorder()),
                            onChanged: (value) => nos = int.parse(value),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          ClassModel classModel = ClassModel(
                              className: name,
                              semester: semester,
                              year: year,
                              numberOfStudent: nos,
                              lessons: []);
                          Navigator.pop(context, classModel);
                        },
                        child: const Text("Add"),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                    ],
                  );
                }).then((value) {
              if (value != null) {
                context
                    .read<ClassBloc>()
                    .add(AddNewClassEvent(classModel: value));
              }
            });
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor: const Color.fromARGB(255, 240, 245, 250),
        body: CustomScrollView(
          slivers: [
            AppBarWidget(
              text: "Class Management",
              centerTitle: true,
              imagePath: appBarLink,
              leading: buildLeadingAppBarIcon(() {
                Navigator.pop(context);
              }),
            ),
            BlocBuilder<ClassBloc, ClassState>(builder: (context, classState) {
              return SliverFixedExtentList(
                itemExtent: 110,
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 12.0),
                    child: ActionTileCard(
                      title: classState.props[index].className,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ClassDetail(
                                  classModel: classState.props[index],
                                )));
                      },
                    ),
                  ),
                  childCount: classState.props.length,
                ),
              );
            }),
            const SliverFooter(content: [
              TextSpan(text: "Made by", style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: " haidang.it",
                  style: TextStyle(color: Color.fromARGB(255, 2, 186, 167))),
              TextSpan(text: " ❤", style: TextStyle(color: Colors.red))
            ])
          ],
        ),
      ),
    );
  }
}
