// colors.dart
import 'package:flutter/material.dart';

const MaterialColor customPurple = MaterialColor(
  0xFF8D4BEF,
  <int, Color>{
    50: Color.fromRGBO(44, 6, 140, .1),
    100: Color.fromRGBO(44, 6, 140, .2),
    200: Color.fromRGBO(44, 6, 140, .3),
    300: Color.fromRGBO(44, 6, 140, .4),
    400: Color.fromRGBO(44, 6, 140, .5),
    500: Color.fromRGBO(44, 6, 140, .6), // 기본 primary 색상
    600: Color.fromRGBO(44, 6, 140, .7),
    700: Color.fromRGBO(44, 6, 140, .8),
    800: Color.fromRGBO(44, 6, 140, .9),
    900: Color.fromRGBO(44, 6, 140, 1),
  },
);

const Color customAccentColor = Color(0xFF8D4BEF); // 단일 색상 정의도 가능
