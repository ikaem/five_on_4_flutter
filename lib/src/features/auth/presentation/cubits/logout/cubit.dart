import 'dart:async';
import 'dart:developer';

import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit.freezed.dart';
part 'cubit_state.dart';

class LogoutCubit extends Cubit<LogoutCubitState> {
  LogoutCubit({
    required this.authUseCases,
  }) : super(LogoutCubitStateInitial());

  final AuthUseCases authUseCases;

  Future<void> onSubmit() async {
    emit(LogoutCubitStateLoading());

    try {
      await authUseCases.logout();
      emit(LogoutCubitStateSuccess());
    } catch (e) {
      if (isClosed) return;
      // TODO we do or should have auth exceptions for better UI feedback
      log('Error -> ${e.toString()}');
      emit(LogoutCubitStateFailure('There was an error logging you out'));
    }

    // TODO test
  }
}
