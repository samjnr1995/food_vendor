import 'package:flutter/material.dart';
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Move to the start point (top-left)
    path.lineTo(0.0, size.height -30); // Start at a point near the bottom

    // Create an upward arc-shaped inward curve at the bottom
    path.cubicTo(
        size.width * 0.25, size.height - 100,   // First control point (near bottom-left)
        size.width * 0.75, size.height - 100,   // Second control point (near bottom-right)
        size.width, size.height - 50            // End point (bottom-right)
    );

    // Draw line to top-right corner
    path.lineTo(size.width, 0.0);

    // Close the path to create the clipping shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
