import 'package:flutter/material.dart';

// pub dev
import 'package:hexcolor/hexcolor.dart';

String mainColor = "07C1E8";

final themeMainColorData = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: TextTheme(
    titleSmall: TextStyle(
      color: HexColor("#$mainColor"),
    ),
    titleMedium: TextStyle(
      color: HexColor("#$mainColor"),
    ),
    titleLarge: TextStyle(
      color: HexColor("#$mainColor"),
    ),
    bodySmall: TextStyle(
      color: HexColor("#$mainColor"),
    ),
    bodyMedium: TextStyle(
      color: HexColor("#$mainColor"),
    ),
    bodyLarge: TextStyle(
      color: HexColor("#$mainColor"),
    ),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: HexColor("#$mainColor"),
    onPrimary: HexColor("#$mainColor"),
    secondary: HexColor("#$mainColor"),
    onSecondary: HexColor("#$mainColor"),
    error: HexColor("#$mainColor"),
    onError: HexColor("#$mainColor"),
    background: HexColor("#$mainColor"),
    onBackground: HexColor("#$mainColor"),
    surface: HexColor("#$mainColor"),
    onSurface: HexColor("#$mainColor"),
  ),
  iconTheme: IconThemeData(
    color: HexColor("#$mainColor"),
  ),
);
