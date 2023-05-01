import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  String title;
  final double? height;
  final double? width;
  final Color? colour, textcolour;
  final double? fontSize;
  final double? buttonRadius;

  // Function callback;
  VoidCallback callback;

  CustomAuthButton(
      {Key? key,
      this.title = "",
      required this.callback,
      this.colour,
      this.textcolour = Colors.white,
      this.height,
      this.width,
      this.fontSize, this.buttonRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0
        ),
        borderRadius: BorderRadius.circular(buttonRadius!)
      ),
      height: height,
      minWidth: width,
      color: colour,

      onPressed: () {
        callback();
      },
      child: Text(
        title,
        style: TextStyle(fontSize: fontSize, color: textcolour),
      ),
    );
  }
}
