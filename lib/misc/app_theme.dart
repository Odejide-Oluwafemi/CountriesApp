import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme with ChangeNotifier {
  final ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    textTheme: TextTheme(
      overline: TextStyle(
        color: Colors.black87,
      ),
      caption: TextStyle(
        color: Colors.grey,
      ),
    ),
  );
  final ThemeData darkTheme = ThemeData(
    canvasColor: Color.fromARGB(198, 5, 0, 77),
    fontFamily: GoogleFonts.montserrat().fontFamily,
    textTheme: TextTheme(
      overline: TextStyle(
        color: Colors.white,
      ),
      caption: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeMode themeMode() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    if (mode == ThemeMode.light) {
      _isDark = false;
    } else {
      _isDark = true;
    }

    notifyListeners();
  }
}
