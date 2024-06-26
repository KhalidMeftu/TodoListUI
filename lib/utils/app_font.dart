import 'dart:ui';
import 'package:flutter/material.dart';

class AppFont{
  static const String ubuntu = 'NotoSerif';
  static TextStyle _baseFont({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: ubuntu,
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  static TextStyle extraSmall({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: 10,
    );
  }

  static TextStyle small({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize:12,
    );
  }

  static TextStyle medium({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: 16,
    );
  }

  static TextStyle large({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: 24,
    );
  }
}