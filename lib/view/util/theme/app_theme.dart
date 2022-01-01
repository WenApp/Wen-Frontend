import 'package:flutter/material.dart';
import 'package:app/view/util/theme/app_colors.dart';

class AppTheme {
  static final ThemeData primaryTheme = ThemeData(
    // colorScheme: ColorScheme(
    //   primary: AppColors.RasinBlack[900]!,
    //   secondary: AppColors.RasinBlack[700]!,
    //   background: AppColors.RasinBlack[900]!,
    //   brightness: null,
    //   error: null,
    //   onBackground: null,
    //   onError: null,
    //   onPrimary: null,
    //   onSecondary: null,
    //   onSurface: null,
    //   primaryVariant: null,
    //   secondaryVariant: null,
    //   surface: null,
    // ),
    primaryColor: AppColors.RasinBlack[900],
    dividerColor: AppColors.RasinBlack[700],
    backgroundColor: AppColors.RasinBlack[900],
    appBarTheme: AppBarTheme(color: AppColors.RasinBlack[900]),
  );
}
