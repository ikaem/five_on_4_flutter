import 'package:flutter/material.dart';

enum SnackBarVariant { info, error }

extension BuildContextExtension on BuildContext {
  void showSnackBarMessage(
    String message, [
    SnackBarVariant variant = SnackBarVariant.info,
  ]) {
    final Color? backgroundColor = variant == SnackBarVariant.error
        ? Colors.red
        : null; // TODO proper theming later
    final Color? textColor =
        variant == SnackBarVariant.error ? Colors.white : null;

    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          content: Text(
            message,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      );
  }
}
