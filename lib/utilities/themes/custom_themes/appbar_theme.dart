import 'package:flutter/material.dart';

import '../../colors.dart';

class TAppBarTheme {
  static var lightAppBarTheme = const AppBarTheme(
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    color: CColors.appBarPrimary,
    titleTextStyle: TextStyle(
      color: CColors.success,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins-Regular",
    ),
  );
}
