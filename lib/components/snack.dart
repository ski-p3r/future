import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;

  const CustomSnackBar({
    Key? key,
    required this.message,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        message,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
