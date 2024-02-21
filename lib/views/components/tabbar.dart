import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyTabbar extends StatelessWidget implements PreferredSizeWidget {
  const MyTabbar({required this.tabs, this.indicatorWeight = 2.0, super.key});

  final List<Widget> tabs;
  final double indicatorWeight;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs,
      labelColor: const Color.fromARGB(255, 0, 247, 255),
      unselectedLabelColor: const Color.fromARGB(255, 215, 222, 225),
      dividerColor: Colors.transparent,
      indicator: const BoxDecoration(
          color: Color.fromARGB(120, 53, 106, 118),
          shape: BoxShape.rectangle,
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 70, 202, 238))),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      indicatorWeight: indicatorWeight,
      indicatorPadding: const EdgeInsets.all(0),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: const Color.fromARGB(255, 97, 221, 255),
      labelPadding: const EdgeInsets.all(2.0),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    );
  }

  @override
  Size get preferredSize {
    double maxHeight = 46.0;
    for (final Widget item in tabs) {
      if (item is PreferredSizeWidget) {
        final double itemHeight = item.preferredSize.height;
        maxHeight = math.max(itemHeight, maxHeight);
      }
    }
    return Size.fromHeight(maxHeight + indicatorWeight);
  }
}
