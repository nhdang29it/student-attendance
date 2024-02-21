import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_student_attendance/blocs/class/class_bloc.dart';
import 'package:flutter_student_attendance/models/class_model.dart';
import 'package:flutter_student_attendance/views/components/leading_appbar_icon.dart';

class ClassDetail extends StatelessWidget {
  const ClassDetail({required this.classModel, super.key});

  final ClassModel classModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Class ${classModel.className}",
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: buildLeadingAppBarIcon(() => Navigator.pop(context)),
        backgroundColor: const Color.fromARGB(255, 9, 125, 119),
        toolbarHeight: 65,
        actions: [
          IconButton(
              onPressed: () {
                showDialog<bool?>(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Delete class"),
                          content:
                              const Text("Are you sure to delete this class?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text("No")),
                          ],
                        )).then((value) {
                  if (value != null && value == true) {
                    context
                        .read<ClassBloc>()
                        .add(DeleteClassEvent(classModel: classModel));
                    Navigator.pop(context);
                  }
                });
              },
              icon: const Icon(
                Icons.delete_forever_rounded,
                color: Color.fromARGB(255, 254, 177, 177),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.note_add),
      ),
      backgroundColor: const Color.fromARGB(255, 240, 245, 250),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            const Text("Thong tin lop hoc: "),
            Text("Ten lop: ${classModel.className}"),
            Text("Nam hoc: ${classModel.year}"),
            Text("Hoc Ki: ${classModel.semester}"),
            Text("Id lop: ${classModel.classId}"),
            const Divider(),
            const Text("Cac buoi hoc gan day"),
            const Text("22/01/2024: Lich su Dang"),
            const Text("23/01/2024: Triet hoc Mac - Lenin"),
            const Divider(),
            const Text("Danh sach sinh vien:"),
            const Text("Nguyen van A"),
            const Text("Nguyen Thi B"),
            const Text("Nguyen van A"),
            const Text("Nguyen Thi B"),
            const Text("Nguyen van A"),
            const Text("Nguyen Thi B"),
            Row(children: <Widget>[
              const Expanded(child: Divider()),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              const Expanded(child: Divider()),
            ])
          ],
        ),
      ),
    );
  }
}
