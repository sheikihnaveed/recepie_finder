
import 'package:flutter/material.dart';

import '../../colors.dart';



class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0,  color: CColors.textDark, ),
    headlineMedium: const TextStyle().copyWith(fontFamily: 'Poppins-SemiBold',
        height: 1, fontSize: 26.0,  color: CColors.textPrimary),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: CColors.textDark),

    titleLarge: const TextStyle().copyWith(
        fontSize: 20.0, fontFamily: 'Poppins-Bold',  color: CColors.textPrimary),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0,  fontFamily: 'Poppins-Medium',  color: CColors.textPrimary),
    titleSmall: const TextStyle().copyWith(
        fontSize: 12.0,  fontFamily: 'Poppins-Regular'),

    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: CColors.textDark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 13.0, fontFamily: 'Poppins-Bold', color: CColors.textDark),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: CColors.textDark.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(
        fontSize: 13.0,
        fontFamily: 'Poppins-Semibold',
        color: CColors.textPrimary,
    ),
    labelMedium: const TextStyle().copyWith(fontSize: 10.0,
        fontFamily: 'Poppins-Medium',
        color: CColors.textDark.withOpacity(0.5)),
    labelSmall: const TextStyle().copyWith(fontSize: 10.0,
        color: CColors.secondGrey),
  );
}