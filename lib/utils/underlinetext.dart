import 'package:flutter/material.dart';
class UnderLineText extends StatelessWidget {
  final String text;
  final Color decorationColor;
  const UnderLineText({Key? key, required this.text, required this.decorationColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        shadows: [
          Shadow(
              color: Colors.red, offset: Offset(0, -5))
        ],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationColor:decorationColor,
        decorationThickness: 1,
      ),
    );
  }
}
