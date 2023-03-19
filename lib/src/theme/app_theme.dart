import 'package:five_on_4_flutter/src/theme/color_schemes.dart';
import 'package:five_on_4_flutter/src/theme/constants/color_constants.dart';
import 'package:five_on_4_flutter/src/theme/text_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  // static const _primaryColorLight = ColorConstants.yellow;
  // static const _secondaryColorLight = ColorConstants.red;
  // static const _backgroundColorLight = ColorConstants.greenLight;
  // static const _scaffoldBackgroundColorLight = ColorConstants.white;
  // static const _textColorLight = ColorConstants.black;

  // static const _primaryColorDark = ColorConstants.greenDark;
  // static const _secondaryColorDark = ColorConstants.greenDark;
  // static const _backgroundColorDark = ColorConstants.black;
  // static const _scaffoldBackgroundColorDark = ColorConstants.greenLight;
  // static const _textColorDark = ColorConstants.white;

// this still needs lots of defining
  // static const ColorScheme _colorSchemeDark = ColorScheme.dark(
  //   primary: Colors.red,
  //   secondary: Colors.red,
  //   background: Colors.white,
  //   onBackground: _textColorDark,
  //   onPrimary: _textColorDark,
  //   onSecondary: _textColorDark,
  // );

  static ThemeData get lightTheme {
    final ThemeData theme = ThemeData(
      colorScheme: AppColorScheme.colorSchemeLight,
      scaffoldBackgroundColor: ColorConstants.greenLight,
      textTheme: AppTextTheme.textTheme,
    );

    return theme;
  }

  static ThemeData get darkTheme {
    final ThemeData theme = ThemeData(
      colorScheme: AppColorScheme.colorSchemeDark,
      appBarTheme: AppBarTheme(backgroundColor: ColorConstants.greenDark),
      textTheme: AppTextTheme.textTheme,
    );

    return theme;
  }
}
