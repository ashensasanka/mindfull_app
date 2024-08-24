import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color color;
  final Color backgroundColor;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onClicked,
    this.color = Colors.white,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        backgroundColor: backgroundColor,
      ),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: color),
      ),
    );
  }
}
