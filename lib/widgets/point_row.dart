import 'package:flutter/material.dart';

class PointRow extends StatelessWidget {
  const PointRow({super.key, required this.icon, required this.text, required this.point, required this.color});

  final IconData icon;
  final String text;
  final String point;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          size: 40,
          color: color,
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          point,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
