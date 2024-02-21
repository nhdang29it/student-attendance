import 'package:flutter/material.dart';

class ActionTileCard extends StatelessWidget {
  const ActionTileCard({required this.title, this.onTap, super.key});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: Colors.blue[50],
              border:
                  Border.all(color: const Color.fromARGB(255, 97, 221, 255)),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.list,
                  weight: 26,
                  size: 26,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
