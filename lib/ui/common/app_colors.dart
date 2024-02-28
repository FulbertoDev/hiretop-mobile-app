import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF130160);
const Color primaryColorDark = Color(0xFF0D0140);
const Color secondaryColor = Color(0xFFD6CDFE);
const Color orangeColor = Color(0xFFFCA34D);
const Color lightGrey = Color(0xFFE4E4E4);
const Color scaffoldBackgroundColor = Color(0xFFf3f4f6);

ThemeData appTheme = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    secondary: primaryColorDark,
    onSecondary: Colors.white,
  ),
  primaryColor: primaryColor,
  primaryColorDark: primaryColorDark,
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: primaryColor,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primaryColor,
    selectionHandleColor: primaryColor,
    selectionColor: primaryColorDark.withOpacity(.3),
  ),
);
