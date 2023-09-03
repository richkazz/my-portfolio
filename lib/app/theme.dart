import 'package:flutter/material.dart';
import 'colors.dart';

final lightTheme = ThemeData(
    primaryColor: lightColor.surfaceColor,
    colorScheme: ColorScheme.light(
      background: lightColor.backgroundColor,
      primary: lightColor.surfaceColor,
    ),
    iconTheme: IconThemeData(color: lightColor.primaryColor));
final darkTheme = ThemeData(
    primaryColor: lightColor.surfaceColor,
    colorScheme: ColorScheme.dark(
      background: darkColor.backgroundColor,
      primary: darkColor.surfaceColor,
    ),
    iconTheme: IconThemeData(color: darkColor.primaryColor));
