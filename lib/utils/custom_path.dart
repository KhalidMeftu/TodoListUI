import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width=size.width;
    double height= size.height-100;
    final path =Path();
    path.lineTo(0, height);
    path.quadraticBezierTo(width*0.5, //50%
        height+100,
        width,
        height);
    path.lineTo(width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
