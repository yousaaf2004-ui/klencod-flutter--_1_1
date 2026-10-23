import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF0B8F4D);
  static const Color primaryLight = Color(0xFF2FC77D);
  static const Color backgroundLight = Color(0xFFEEF6F1);
  static const Color cardLight = Colors.white;
  static const Color textLight = Color(0xFF14261D);
  static const Color mutedLight = Color(0xFF5D7568);
  static const Color borderLight = Color(0xFFD9EADF);
  static const Color warning = Color(0xFFE5484D);
  static const Color accent = Color(0xFFF5B829);

  static const Color backgroundDark = Color(0xFF09140F);
  static const Color cardDark = Color(0xFF122019);
  static const Color textDark = Color(0xFFE6F4EC);
  static const Color mutedDark = Color(0xFF8F80A0);
  static const Color borderDark = Color(0xFF1F3A2C);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundLight,
    primaryColor: primary,
    cardColor: cardLight,
    fontFamily: 'Segoe UI',
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundDark,
    primaryColor: primaryLight,
    cardColor: cardDark,
    fontFamily: 'Segoe UI',
    useMaterial3: true,
  );
}
