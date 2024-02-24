import 'package:flutter/material.dart';
import 'package:shopfusion/utils/theme/custom_theme/appbar_theme.dart';
import 'package:shopfusion/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:shopfusion/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:shopfusion/utils/theme/custom_theme/chip_theme.dart';
import 'package:shopfusion/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:shopfusion/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:shopfusion/utils/theme/custom_theme/text_field_theme.dart';
import 'package:shopfusion/utils/theme/custom_theme/text_theme.dart';

class SfAppTheme {
  SfAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: SfTextTheme.lightTextTheme,
    chipTheme: SfChipTheme.LightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: SfAppBarTheme.lightAppBarTheme,
    checkboxTheme: SfCheckboxTheme.lightCheckboxThemeData,
    bottomSheetTheme: SfBottomSheetThemeData.lightBottomSheetThemeData,
    elevatedButtonTheme: SfElevatedButtonTheme.lightElevated,
    outlinedButtonTheme: SfOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SfTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData DarkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: SfTextTheme.DarkTextTheme,
    chipTheme: SfChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: SfAppBarTheme.darkAppBarTheme,
    checkboxTheme: SfCheckboxTheme.darkCheckboxThemeData,
    bottomSheetTheme: SfBottomSheetThemeData.darkBottomSheetThemeData,
    elevatedButtonTheme: SfElevatedButtonTheme.DarkElevated,
    outlinedButtonTheme: SfOutlinedButtonTheme.DarkOutlinedButtonTheme,
    inputDecorationTheme: SfTextFormFieldTheme.darkInputDecorationTheme,
  );
}
