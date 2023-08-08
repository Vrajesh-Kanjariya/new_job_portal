import 'package:flutter/material.dart';

import '../constant/color_constant.dart';

class AppTheme {
  AppTheme(_);

  //     ======================= Font Family =======================     //
  static const String defaultFont = 'Inter';

  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: ColorConstant.themeScaffold,
    fontFamily: defaultFont,
    dividerColor: ColorConstant.transparent,
    elevatedButtonTheme: elevatedButtonThemeData,
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
  );

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      // backgroundColor: MaterialStateProperty.all(ColorConstant.themeScaffold),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 26, vertical: 10)),
      elevation: MaterialStateProperty.all(0),
    ),
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
    centerTitle: true,
    color: ColorConstant.darkBlue,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: defaultFont,
      fontSize: 18,
      color: ColorConstant.white,
      fontWeight: FontWeight.w500,
    ),
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: const TextStyle(
      fontFamily: defaultFont,
      fontSize: 16,
      color: ColorConstant.grey,
      letterSpacing: 0.48,
    ),
    filled: true,
    fillColor: ColorConstant.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: ColorConstant.transparent),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: ColorConstant.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: ColorConstant.transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: ColorConstant.red, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: ColorConstant.blue, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: ColorConstant.red.withOpacity(0.6),
        width: 2,
      ),
    ),
  );
}
