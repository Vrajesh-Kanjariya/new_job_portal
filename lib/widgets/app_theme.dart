import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color_constant.dart';

class AppTheme {
  AppTheme(_);

  //     ======================= Font Family =======================     //
  static const String defaultFont = 'Inter';

  static const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE7E6FA),
    100: Color(0xFFC2C1F2),
    200: Color(0xFF9A98EA),
    300: Color(0xFF726FE1),
    400: Color(0xFF5350DA),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF302CCF),
    700: Color(0xFF2825C9),
    800: Color(0xFF221FC3),
    900: Color(0xFF1613B9),
  });
  static const int _primaryPrimaryValue = 0xFF3531D4;

  static const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFFEAEAFF),
    200: Color(_primaryAccentValue),
    400: Color(0xFF8584FF),
    700: Color(0xFF6C6AFF),
  });
  static const int _primaryAccentValue = 0xFFB8B7FF;

  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: ColorConstant.themeScaffold,
    primarySwatch: primary,
    fontFamily: defaultFont,
    highlightColor: ColorConstant.transparent,
    splashColor: ColorConstant.transparent,
    hoverColor: ColorConstant.transparent,
    dividerColor: ColorConstant.transparent,
    elevatedButtonTheme: elevatedButtonThemeData,
    appBarTheme: appBarTheme,
    // inputDecorationTheme: inputDecorationTheme,
      scrollbarTheme: ScrollbarThemeData(
        trackVisibility:  MaterialStateProperty.all(true),
        thickness: MaterialStateProperty.all(5),
        radius: const Radius.circular(10),
        thumbColor: MaterialStateProperty.all(const Color(0xffd4d4d4)),
      )
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
    centerTitle: true,
    color: ColorConstant.blue,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: defaultFont,
      fontSize: 18,
      color: ColorConstant.white,
      fontWeight: FontWeight.w500,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorConstant.blue,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
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

  // static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  //   hintStyle: const TextStyle(
  //     fontFamily: defaultFont,
  //     fontSize: 16,
  //     color: ColorConstant.grey,
  //     letterSpacing: 0.48,
  //   ),
  //   filled: true,
  //   fillColor: ColorConstant.white,
  //   // border: OutlineInputBorder(
  //   //   borderRadius: BorderRadius.circular(6),
  //   //   borderSide: const BorderSide(color: ColorConstant.transparent),
  //   // ),
  //   disabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(6),
  //     borderSide: const BorderSide(color: ColorConstant.transparent),
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(6),
  //     borderSide: const BorderSide(color: ColorConstant.transparent),
  //   ),
  //   errorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(6),
  //     borderSide: const BorderSide(color: ColorConstant.red, width: 2),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(6),
  //     borderSide: const BorderSide(color: ColorConstant.blue, width: 2),
  //   ),
  //   focusedErrorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(6),
  //     borderSide: BorderSide(
  //       color: ColorConstant.red.withOpacity(0.6),
  //       width: 2,
  //     ),
  //   ),
  // );
}
