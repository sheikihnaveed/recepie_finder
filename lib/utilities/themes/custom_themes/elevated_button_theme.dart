import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../sizes.dart';
/* -- Light & Dark Elevated Button Themes -- */
class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CColors.textSecondary,
      backgroundColor: CColors.primary,
      // disabledForegroundColor: CColors.darkGrey,
      // disabledBackgroundColor: CColors.buttonDisabled,
      // side: const BorderSide(color: CColors.primary),
      padding: const EdgeInsets.symmetric(vertical: SSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, fontFamily: 'Poppins-Bold'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  // static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     elevation: 0,
  //     // foregroundColor: CColors.light,
  //     backgroundColor: CColors.primary,
  //     // disabledForegroundColor: CColors.darkGrey,
  //     // disabledBackgroundColor: CColors.darkerGrey,
  //     side: const BorderSide(color: CColors.primary),
  //     padding: const EdgeInsets.symmetric(vertical: SSizes.buttonHeight),
  //     textStyle: const TextStyle(fontSize: 16, color: CColors.textSecondary, fontWeight: FontWeight.w600),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.buttonRadius)),
  //   ),
  // );
}
