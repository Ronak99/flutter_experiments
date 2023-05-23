import 'package:flutter/material.dart';

class CircularClipper extends CustomClipper<Path> {
  CircularClipper({this.centerX, this.centerY, this.radius});
  final double? centerX;
  final double? centerY;
  final double? radius;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(centerX!, centerY!);
    path.addOval(
        Rect.fromCircle(center: Offset(centerX!, centerY!), radius: radius!));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
