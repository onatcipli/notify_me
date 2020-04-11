import 'package:flutter/material.dart';

const darkPrimary = Color(0xff222831);
const lightPrimary = Color(0xffF5F5F5);
const secondaryLight = Color(0xffFC5185);
const secondaryDark = Color(0xff3FC1C9);
const onPrimary = Color(0xff30E3CA);

ThemeData customTheme = ThemeData(
  colorScheme: ColorScheme(
      primary: darkPrimary,
      primaryVariant: onPrimary,
      secondary: lightPrimary,
      secondaryVariant: secondaryDark,
      surface: null,
      background: null,
      error: null,
      onPrimary: onPrimary,
      onSecondary: null,
      onSurface: null,
      onBackground: null,
      onError: null,
      brightness: null),
);
