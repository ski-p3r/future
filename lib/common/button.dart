import 'package:flutter/material.dart';
import 'package:future/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color activeColor = Theme.of(context).brightness == Brightness.dark
        ? MainColors.darkActive
        : MainColors.active;

    final Color textColor = Theme.of(context).brightness == Brightness.dark
        ? MainColors.text
        : MainColors.darkText;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: activeColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
