import 'package:flutter/material.dart';
import 'package:flutter_student_attendance/models/class_model.dart';

class ListClassDialog extends StatefulWidget {
  const ListClassDialog({required this.listClass, super.key});

  final List<ClassModel> listClass;

  @override
  State<ListClassDialog> createState() => _ListClassDialogState();
}

class _ListClassDialogState extends State<ListClassDialog> {
  ClassModel? selectedValue;

  // @override
  // void initState() {
  //   super.initState();
  //   // selectedValue = widget.listClass.first.classId;
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('Select a class'),
      content: Container(
        height: 65,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 247, 235, 199),
            border: Border.all(color: Colors.black38),
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: Center(
          child: DropdownButton<ClassModel>(
            value: selectedValue,
            style: const TextStyle(
              fontSize: 16,
              letterSpacing: 1.5,
              color: Color.fromARGB(255, 119, 91, 6),
              fontWeight: FontWeight.w500,
            ),
            icon: const Icon(Icons.arrow_drop_down_rounded),
            menuMaxHeight: 300,
            underline: const SizedBox(),
            hint: const Text(
              "Select Item Type",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.end,
            ),
            dropdownColor: const Color.fromARGB(255, 255, 250, 233),
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            onChanged: (ClassModel? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: widget.listClass
                .map<DropdownMenuItem<ClassModel>>(
                  (ClassModel value) => DropdownMenuItem<ClassModel>(
                    value: value,
                    child: Text(value.className),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(selectedValue); // Close the dialog
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
