import 'package:flutter/material.dart';
import 'color.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(

        scaffoldBackgroundColor: Color(0xffffffff),
        appBarTheme: AppBarTheme(
            color: Color(0xffffffff), surfaceTintColor: Colors.transparent),
        iconTheme: IconThemeData(color: Color(0xffffffff), size: 26),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff000000),
            unselectedItemColor: Color(0xff000000),
            selectedItemColor: Color(0xffb167F71)),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: onPrimaryColor,
            secondary: secondaryColor,
            onSecondary: onSecondaryColor,
            error: errorColor,
            onError: onErrorColor,
            surface: surfaceColor,
            onSurface: onSurfaceColor));
  }
}
