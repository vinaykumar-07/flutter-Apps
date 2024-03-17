import 'package:flutter/material.dart';

@immutable
class SmallText extends StatelessWidget {
  Color color;
  FontWeight fontWeight;
  final String text;
  double size;
  double height;

  SmallText(
      {super.key,
      this.size = 12,
      this.height = 1.2,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          height: height),
    );
  }
}
