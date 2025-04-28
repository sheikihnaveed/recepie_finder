import 'package:flutter/material.dart';

import '../../colors.dart';

class TAppBarTheme {
  static var lightAppBarTheme = const AppBarTheme(
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    color: CColors.appBarPrimary,
    titleTextStyle: TextStyle(fontSize: 20.0, height: 1, fontFamily: 'Poppins-Bold', color: CColors.textPrimary),
  );
}
