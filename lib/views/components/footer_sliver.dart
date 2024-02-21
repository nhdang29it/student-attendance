import 'package:flutter/material.dart';

class SliverFooter extends StatelessWidget {
  const SliverFooter({required this.content, super.key});

  final List<TextSpan> content;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 20),
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [for (TextSpan textSpan in content) textSpan],
            ),
          ),
        ),
      ),
    );
  }
}
