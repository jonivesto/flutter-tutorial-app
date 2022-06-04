import 'package:flutter/material.dart';

class Routes{
  static const String homeRoute = "/";
  static const String splashRoute = "/splash";
}

class Apis{
  static const profileApi = "https://randomuser.me/api";
}

class Themes{
  static final ThemeData lightTheme = ThemeData.light();
  static final ThemeData darkTheme = ThemeData.dark();

  static ThemeData getThemeByName(String themeName) {
    if(themeName == "light") {
      return lightTheme;
    } else if(themeName == "dark"){
      return darkTheme;
    } else {
      throw Exception("Incorrect case");
    }
  }
}