import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;
  const BigText(
      {super.key,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis,
      this.color = const Color(0xFF332d2b),
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: overflow,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? 26 : size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
