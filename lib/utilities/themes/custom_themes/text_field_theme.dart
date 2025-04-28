import 'package:flutter/material.dart';
import '../../colors.dart';
import '../../sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CColors.primary,
    suffixIconColor: CColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: SSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: SSizes.fontSizeMd, color: CColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: SSizes.fontSizeSm, color: CColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: CColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CColors.accent),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CColors.accent),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CColors.textPrimary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CColors.failed),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CColors.pending),
    ),
  );
}
