import 'package:flutter/material.dart';

Widget buildLeadingAppBarIcon(VoidCallback? onPressed) => IconButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(71, 255, 255, 255),
        shape: const CircleBorder(),
        // fixedSize: Size(10, 10),
      ),
      icon: const Icon(
        Icons.arrow_back_ios_outlined,
        size: 24,
        weight: 12.0,
        color: Colors.white,
      ),
    );
