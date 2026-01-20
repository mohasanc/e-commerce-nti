import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get lightMode => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarThemeData(
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.black),
    ),
    cardTheme: CardThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFF4E0189),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      labelStyle: TextStyle(color: const Color.fromARGB(255, 29, 13, 13)),
      hintStyle: TextStyle(color: Colors.black),
      prefixIconColor: Colors.black,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.black),
      contentPadding: EdgeInsets.all(10),
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );

  static ThemeData get darkMode => ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarThemeData(
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.white),
      displayMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
    ),
    cardTheme: CardThemeData(color: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        iconColor: Colors.white,
        backgroundColor: Color(0XFF4E0189),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.white),
      prefixIconColor: Colors.white,
      errorStyle: TextStyle(color: Colors.red, fontSize: 14),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black87),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.all(10),
    ),
  );
}

//  class AppThemeData {
//  static ThemeData lightMode() {
//     return ThemeData(
//       scaffoldBackgroundColor: Colors.white,
//       appBarTheme: AppBarTheme(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         centerTitle: true,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(backgroundColor: Color(0XFF4E0189)),
//       ),
//     );
//   }

//   static ThemeData darkMode() {
//     return ThemeData(
//       scaffoldBackgroundColor: Colors.black,
//       appBarTheme: AppBarTheme(
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//         centerTitle: true,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(backgroundColor: Color(0XFF4E0189)),
//       ),
//     );
//   }
// }
