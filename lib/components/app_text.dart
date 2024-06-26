import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String text;
  double font_size;
  Color color;
  FontWeight fontWeight;
  AppText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontWeight,
      required this.font_size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: font_size, fontWeight: fontWeight, color: color),
    );
  }
}
