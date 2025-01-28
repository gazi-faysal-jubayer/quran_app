import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppConstants.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: AppConstants.primaryColor,
      elevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0,
    ),
  );
}