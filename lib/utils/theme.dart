import 'package:flutter/material.dart';

final lightThemeData = ThemeData( 
      tabBarTheme: const TabBarTheme(labelColor: Colors.red,indicatorColor: Colors.red),
      elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.red))),
      scaffoldBackgroundColor: Colors.red,
      appBarTheme: const AppBarTheme(color: Colors.black),
      colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      );

final darkThemeData = ThemeData.dark().copyWith(
        tabBarTheme: const TabBarTheme(labelColor: Colors.black,indicatorColor: Colors.red),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.amber))),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(color: Colors.black),
        colorScheme: const ColorScheme.dark(),
       
      );