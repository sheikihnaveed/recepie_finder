import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: CColors.textPrimary,
      side: const BorderSide(color: CColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Poppins-Bold'),
      padding: const EdgeInsets.symmetric(vertical: SSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  // static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
  //   style: OutlinedButton.styleFrom(
  //     // foregroundColor: CColors.light,
  //     side: const BorderSide(color: CColors.borderPrimary),
  //     textStyle: TextStyle(fontSize: 16, color: CColors.textSecondary, fontWeight: FontWeight.w600),
  //     padding: const EdgeInsets.symmetric(vertical: SSizes.buttonHeight, horizontal: 20),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.buttonRadius)),
  //   ),
  // );
}
