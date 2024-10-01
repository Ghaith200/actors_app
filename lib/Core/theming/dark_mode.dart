import 'package:flutter/material.dart';
import 'package:gallery_app/Core/helpers/my_colors.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    // ignore: deprecated_member_use
    background: MyColors.myGrey,
    primary: MyColors.myBlue,
    secondary: MyColors.myWhite,
    tertiary: MyColors.myGrey,
  ),
);
