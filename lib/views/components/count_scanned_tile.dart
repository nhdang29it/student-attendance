import 'package:flutter/material.dart';

class CountScannedTile extends StatelessWidget {
  const CountScannedTile(
      {required this.scanned, required this.unScanned, super.key});

  final int scanned, unScanned;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Đã điểm danh:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          scanned.toString(),
          style: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 39, 204, 69)),
        ),
        const SizedBox(
          width: 2,
        ),
        const Text(
          "SV",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Text(
          "Còn ($unScanned)",
          style: const TextStyle(fontSize: 18, color: Colors.red),
        ),
        const SizedBox(
          width: 6,
        )
      ],
    );
  }
}
