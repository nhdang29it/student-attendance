import 'package:flutter/material.dart';

class ActionGridCard extends StatelessWidget {
  const ActionGridCard(
      {this.color,
      required this.title,
      this.description = "description",
      required this.onTap,
      required this.icon,
      super.key});

  final Color? color;
  final String title;
  final String? description;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Card(
          elevation: 0,
          child: Container(
            height: 80,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    style: BorderStyle.solid,
                    color: color ?? const Color(0xff000000)),
                // color: color,
                gradient: LinearGradient(
                  colors: [
                    color!.withOpacity(1),
                    color!.withOpacity(0.6),
                    color!.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 34,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text("$description"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
