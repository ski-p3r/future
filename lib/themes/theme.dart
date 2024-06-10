import 'package:flutter/material.dart';
import 'package:future/constants/colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: MainColors.active,
    scaffoldBackgroundColor: MainColors.background,
    cardColor: MainColors.boxColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: MainColors.pText),
      bodyMedium: TextStyle(color: MainColors.pText),
      bodySmall: TextStyle(
        color: MainColors.pText,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(color: MainColors.text), // Add headline1 style
      headlineMedium: TextStyle(color: MainColors.text), // Add headline2 style
      headlineSmall: TextStyle(color: MainColors.text),
    ),
    fontFamily: 'Poppins',
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: MainColors.darkActive,
    scaffoldBackgroundColor: MainColors.darkBackground,
    cardColor: MainColors.darkBoxColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: MainColors.pDarkText),
      bodyMedium: TextStyle(color: MainColors.pDarkText),
      bodySmall: TextStyle(
        color: MainColors.pDarkText,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge:
          TextStyle(color: MainColors.darkText), // Add headline1 style
      headlineMedium:
          TextStyle(color: MainColors.darkText), // Add headline2 style
      headlineSmall: TextStyle(color: MainColors.darkText),
    ),
  );
}
