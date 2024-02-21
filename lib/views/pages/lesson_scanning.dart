import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_student_attendance/image_links.dart';
import 'package:flutter_student_attendance/views/components/leading_appbar_icon.dart';
import 'package:flutter_student_attendance/views/components/tabbar.dart';
import 'package:flutter_student_attendance/views/pages/list_scanned_student.dart';
import 'package:flutter_student_attendance/views/pages/scanner.dart';

class LessonScanning extends StatelessWidget {
  const LessonScanning({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "LESSON",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: buildLeadingAppBarIcon(() {
            Navigator.pop(context);
          }),
          centerTitle: true,
          toolbarHeight: 90,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // image: NetworkImage(imagePath),
                image: AssetImage(appBarLink),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 0.6, sigmaY: 0.6, tileMode: TileMode.clamp),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(221, 0, 36, 42),
                        Color.fromARGB(115, 0, 77, 88),
                        Color.fromARGB(100, 0, 78, 90)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          ),
          bottom: const MyTabbar(tabs: [
            Icon(Icons.checklist_rounded),
            Icon(Icons.qr_code_scanner),
          ]),
        ),
        body: const TabBarView(
          children: [
            ListScannedStudent(),
            Scanner(),
          ],
        ),
      ),
    );
  }
}
