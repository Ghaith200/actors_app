import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';

ThemeData lightmode = ThemeData(
  colorScheme: const ColorScheme.light(
    // ignore: deprecated_member_use
    background: MyColors.myWhite,
    primary: MyColors.myGrey,
    secondary: MyColors.myYellow,
    tertiary: MyColors.myWhite,
  ),
);
