import 'package:flutter/material.dart';

/// getLightTheme
ThemeData getLightTheme() {
  return ThemeData(
    // useMaterial3: true,
    fontFamily: 'SFPro',
    primarySwatch: Colors.blue,
    brightness: Brightness.light,

    // primaryColor: Colors.white,
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   elevation: 0,
    //   foregroundColor: Colors.white,
    // ),
    dividerColor: const Color(0xFF9A9A9A),
    // focusColor: parseColor(setting.value.accentColor),
    hintColor: const Color(0xFFE8E8E8),
    iconTheme: const IconThemeData(color: Colors.black),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black,
    ),
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //       foregroundColor: parseColor(setting.value.mainColor)),
    // ),
    // colorScheme: ColorScheme.light(
    //   primary: parseColor(setting.value.mainColor),
    //   secondary: parseColor(setting.value.mainColor),
    // ),
    textTheme: const TextTheme(
      // headline6 => ***
      titleLarge: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w700,
        height: 1.5,
      ),
      // headline5
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      // headline4 => ***
      headlineMedium: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      // headline3
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        // color: parseColor(setting.value.secondColor),
        height: 1.3,
      ),
      // headline2
      displayMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.4,
      ),
      // headline1 => ***
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.4,
        color: Colors.black,
      ),
      // subtitle2 => ***
      titleSmall: TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
      // subtitle1
      titleMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
      // bodyText2
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        // color: parseColor(setting.value.secondColor),
        height: 1.2,
      ),
      // bodyText1
      bodyLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        // color: parseColor(setting.value.secondColor),
        height: 1.2,
      ),
      // caption
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        // color: parseColor(setting.value.accentColor),
        height: 1.2,
      ),
    ),
  );
}

/// getDarkTheme
ThemeData getDarkTheme() {
  return ThemeData(
    // useMaterial3: true,
    fontFamily: 'SFPro',
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    // primaryColor: const Color(0xFF252525),
    // floatingActionButtonTheme:
    //     const FloatingActionButtonThemeData(elevation: 0),
    // scaffoldBackgroundColor: const Color(0xFF2C2C2C),
    // brightness: Brightness.dark,
    dividerColor: const Color(0xFF4C4C4C),
    // focusColor: parseColor(setting.value.accentDarkColor),
    hintColor: const Color(0xFF2D2D2D),
    iconTheme: const IconThemeData(color: Colors.white),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
    ),
    // toggleableActiveColor: parseColor(setting.value.mainDarkColor),
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //       foregroundColor: parseColor(setting.value.mainColor)),
    // ),
    // colorScheme: ColorScheme.dark(
    //   primary: parseColor(setting.value.mainDarkColor),
    //   secondary: parseColor(setting.value.mainDarkColor),
    // ),
    textTheme: const TextTheme(
      // headline6
      titleLarge: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        height: 1.5,
      ),
      // headline5
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        // color: parseColor(setting.value.secondDarkColor),
        height: 1.3,
      ),
      // headline4 => ***
      headlineMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      // headline3
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        // color: parseColor(setting.value.secondDarkColor),
        height: 1.3,
      ),
      // headline2
      displayMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.4,
      ),
      // headline1 => ***
      displayLarge: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        height: 1.4,
      ),
      // subtitle2 => ***
      titleSmall: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
      // subtitle1
      titleMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
      // bodyText2
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        // color: parseColor(setting.value.secondDarkColor),
        height: 1.2,
      ),
      // bodyText1
      bodyLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        // color: parseColor(setting.value.secondDarkColor),
        height: 1.2,
      ),
      // caption
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        // color: parseColor(setting.value.accentDarkColor),
        height: 1.2,
      ),
    ),
  );
}
