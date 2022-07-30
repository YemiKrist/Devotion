import 'package:flutter/material.dart';

import 'colors.dart';

const TextTheme TEXT_THEME_DEFAULT = TextTheme(
  headline1: TextStyle(
      color: textColorWhite,
      fontWeight: FontWeight.w700,
      fontSize: 26,
      fontFamily: 'Euclid-Bold'),
  headline2: TextStyle(
      color: textColorWhite,
      fontWeight: FontWeight.w500,
      fontSize: 26,
      fontFamily: 'Euclid-SemiBold'),
  headline3: TextStyle(
      color: textColorWhite,
      fontWeight: FontWeight.w700,
      fontSize: 22,
      fontFamily: 'Euclid-Medium'),
  headline4: TextStyle(
      color: textColorBlack,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: 'Euclid-Bold'),
  subtitle1: TextStyle(
      color: textColorSub,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16),
  bodyText1: TextStyle(
      color: textColorBlack,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16),
);

const TextTheme TEXT_THEME_SMALL = TextTheme(
  headline1: TextStyle(
      color: textColorWhite,
      fontWeight: FontWeight.w700,
      fontSize: 22,
      fontFamily: 'Euclid-Bold'),
  headline2: TextStyle(
      color: textColorWhite,
      fontWeight: FontWeight.w500,
      fontSize: 22,
      fontFamily: 'Euclid-SemiBold'),
  headline3: TextStyle(
      color: textColorWhite,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      fontFamily: 'Euclid-Medium'),
  headline4: TextStyle(
      color: textColorBlack,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: 'Euclid-Bold'),
  subtitle1: TextStyle(
      color: textColorSub,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14),
  bodyText1: TextStyle(
      color: textColorBlack,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16),
);
