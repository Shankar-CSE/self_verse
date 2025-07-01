import 'package:flutter/material.dart';

/// A stateless widget that displays a colored floating circle.
/// 
/// size determines the diameter of the circle.
/// color sets the fill color of the circle.
class FloatingCircle extends StatelessWidget {
  final double size; // Diameter of the circle
  final Color color; // Fill color of the circle

  /// Creates a [FloatingCircle] widget.
  /// 
  /// Both [size] and [color] are required.
  const FloatingCircle({
    super.key,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Returns a circular container with the specified size and color
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