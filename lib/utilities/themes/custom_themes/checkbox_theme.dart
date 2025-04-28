import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../sizes.dart';

/// Custom Class for Light & Dark Text Themes
class TCheckboxTheme {
  TCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CColors.white;
      } else {
        return CColors.dark;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  // static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.xs)),
  //   checkColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return CColors.white;
  //     } else {
  //       return CColors.dark;
  //     }
  //   }),
  //   fillColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return CColors.primary;
  //     } else {
  //       return Colors.transparent;
  //     }
  //   }),
  // );
}
