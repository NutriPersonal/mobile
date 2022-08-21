import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Inter",
  primaryColor: AppColors.primary,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primary,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: AppColors.primary,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.primary,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: AppColors.pLighter,
    iconColor: AppColors.primary,
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: AppColors.primary.withAlpha(180),
        // width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: AppColors.primary.withAlpha(180),
        // width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: AppColors.primary.withAlpha(180),
        // width: 2,
      ),
    ),
    labelStyle: TextStyle(
      color: Colors.grey.shade400,
      fontWeight: FontWeight.w400,
    ),
  ),
);
