import 'package:flutter/material.dart';

class NoteChart extends StatelessWidget {
  final String name;
  final Color color;
  const NoteChart({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 9,
          color: color,
          width: 24,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
