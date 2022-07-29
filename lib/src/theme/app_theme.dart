import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFC74846);

  static final ThemeData lightTheme = ThemeData(
      // primaryColor: primary,
      // appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      // buttonTheme: const ButtonThemeData(
      //     buttonColor: primary, textTheme: ButtonTextTheme.accent),
      // textButtonTheme: TextButtonThemeData(
      //     style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all<Color>(primary),
      //         foregroundColor: MaterialStateProperty.all<Color>(Colors.white))),
      // Other:
      // textButtonTheme:
      //     TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
      // iconTheme: const IconThemeData(color: primary),

      // FloatingActionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, foregroundColor: Colors.white),

      // ElevatedButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), elevation: 5),
      ),
      //ColorScheme
      colorScheme:
          const ColorScheme.light(primary: primary, onPrimary: Colors.white),
      // Inputs
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primary),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
      ));
}
