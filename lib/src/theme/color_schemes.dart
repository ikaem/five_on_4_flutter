import 'package:five_on_4_flutter/src/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';

abstract class AppColorScheme {
  static const ColorScheme colorSchemeLight = ColorScheme.light(
    primary: ColorConstants.yellow,
    secondary: ColorConstants.red,
    tertiary: ColorConstants.greenDark,
    background: ColorConstants.red,
    onPrimary: ColorConstants.black,
    onSecondary: ColorConstants.yellow,
    onTertiary: ColorConstants.white,
    onBackground: ColorConstants.white,
  );

  static const ColorScheme colorSchemeDark = ColorScheme.dark(
    primary: Colors.red,
    secondary: Colors.red,
    background: Colors.white,
    // onBackground: _textColorDark,
    // onPrimary: _textColorDark,
    // onSecondary: _textColorDark,
  );
}
