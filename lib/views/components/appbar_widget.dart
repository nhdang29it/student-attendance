import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {required this.text,
      required this.imagePath,
      this.centerTitle = false,
      this.leading,
      this.bottom,
      super.key});

  final String text;
  final String imagePath;
  final bool centerTitle;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        text,
        softWrap: true,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      // backgroundColor: const Color.fromARGB(255, 128, 155, 255),
      centerTitle: centerTitle,
      leading: leading,
      expandedHeight: 180,
      collapsedHeight: 65,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      pinned: true,
      floating: true,
      stretch: true,
      // collapsedHeight: 80,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // image: NetworkImage(imagePath),
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 0.3, sigmaY: 0.3, tileMode: TileMode.clamp),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(224, 0, 43, 50),
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
      bottom: bottom,
    );
  }
}
