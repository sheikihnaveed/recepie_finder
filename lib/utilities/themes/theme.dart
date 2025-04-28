import 'package:flutter/material.dart';

import '../colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class AAppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    useMaterial3: true,
    fontFamily: 'Poppins-Regular',
    brightness: Brightness.light,
    primaryColor: CColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    // checkboxTheme: TCheckboxTheme.lightCheckboxTheme,lightCheckboxTheme
  );
}
