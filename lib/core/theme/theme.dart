import 'package:flutter/material.dart';
import 'package:plant_health_monitor/core/theme/app_pallet.dart';

class AppTheme {
  static _border([Color color = Colors.grey]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallet.black,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(AppPallet.lightGreen),
      contentPadding: const EdgeInsets.all(25),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallet.black,
      shadowColor: AppPallet.transparent,
    ),
    cardTheme: const CardTheme(
        elevation: 1,
        color: AppPallet.cardColor,
        surfaceTintColor: Colors.transparent),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.blueAccent; // Color when pressed
          } else if (states.contains(WidgetState.disabled)) {
            return Colors.grey; // Color when disabled
          }
          return Colors.red.shade400; // Default color
        }),
      ),
    ),
  );
}
