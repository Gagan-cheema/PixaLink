import 'package:flutter/material.dart';

// reponsive text widget
class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  const AppText(this.text, {super.key, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        text,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize ?? 10, color: color),
      ),
    );
  }
}
