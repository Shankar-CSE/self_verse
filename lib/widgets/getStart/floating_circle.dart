import 'package:flutter/material.dart';

class FloatingCircle extends StatelessWidget {
  final double size;
  final Color color;

  const FloatingCircle({
    super.key,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}