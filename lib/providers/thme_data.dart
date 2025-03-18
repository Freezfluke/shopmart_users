import 'package:flutter/material.dart';
import 'package:shopmart_users/consts/app_colors.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      cardTheme: CardTheme(
          color: isDarkTheme ? AppColors.darkCard : AppColors.lightScaffold,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.darkCard, width: 0.05),
            borderRadius: BorderRadius.circular(5.0),
          ),
          shadowColor: isDarkTheme
              ? const Color.fromARGB(255, 80, 52, 104)
              : AppColors.lightScaffold,
          elevation: 1.5),
      fontFamily: 'Kanit',
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            isDarkTheme ? AppColors.darkLightScaffold : AppColors.lightScaffold,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
      ),
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.darkLightScaffold : AppColors.lightScaffold,
      cardColor: isDarkTheme ? AppColors.darkCard : AppColors.lightCard,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor:
            isDarkTheme ? AppColors.darkLightScaffold : AppColors.lightScaffold,
        elevation: 0,
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        titleTextStyle: TextStyle(
            color: isDarkTheme ? Colors.white : Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.normal,
            fontFamily: 'Kanit'),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        elevation: 12.0,
        textStyle: const TextStyle(
          fontFamily: 'Kanit', // Ensure font family stays the same
          fontSize: 18,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      )),
      iconTheme:
          IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
    );
  }
}
