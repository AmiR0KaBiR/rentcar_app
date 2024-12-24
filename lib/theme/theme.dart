import 'package:flutter/material.dart';
import 'color.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(

        scaffoldBackgroundColor: Color(0xffF5F9FF),
        appBarTheme: AppBarTheme(
            color: Color(0xffF5F9FF), surfaceTintColor: Colors.transparent),
        iconTheme: IconThemeData(color: Color(0xffffffff), size: 26),
        fontFamily: 'Jost',
        textTheme: TextTheme(
            bodySmall:
                TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.w800),
            labelLarge:
                TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.w700),
            labelMedium:
                TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.w500),
            labelSmall:
                TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.w400),
            titleLarge:
                TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.w300),
            titleMedium:
                TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.w200),
            titleSmall:
                TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.w100)),
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
