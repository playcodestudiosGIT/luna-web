import 'package:flutter/material.dart';
import 'package:luna_aconstruction/config/constants.dart';

class AppTheme {
  ThemeData getTheme() {
    
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: primaryColor,
      listTileTheme: const ListTileThemeData(
        iconColor: primaryColor
      ),
      brightness: Brightness.dark
    );
  }
}
