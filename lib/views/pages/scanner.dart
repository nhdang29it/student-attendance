import 'package:flutter/material.dart';
import 'package:flutter_student_attendance/views/components/count_scanned_tile.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        children: [
          const CountScannedTile(scanned: 68, unScanned: 12),
          const SizedBox(
            height: 22,
          ),
          const Text("Scanner"),
          const SizedBox(
            height: 35,
          ),
          Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color.fromARGB(255, 175, 209, 226),
            ),
            child: const Icon(Icons.camera),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Open camera"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Close camera"),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
