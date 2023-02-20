import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:five_on_4_flutter/src/presentation/cubits/initial_data/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  PlayerModel? get currentPlayer => read<InitialDataCubit>().currentPlayer;
}
