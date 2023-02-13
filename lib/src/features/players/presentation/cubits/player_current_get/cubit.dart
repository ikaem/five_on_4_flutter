import 'dart:developer';

import 'package:five_on_4_flutter/src/features/auth/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

class PlayerCurrentGetCubit extends Cubit<PlayerCurrentGetCubitState> {
  PlayerCurrentGetCubit({
    required AuthStatusProvider authStatusProvider,
    // required PlayersUseCases playersUseCases,
  })  : _authStatusProvider = authStatusProvider,
        super(PlayerCurrentGetCubitStateInitial()) {
    // this could be a function triggered by a call from backend
    // also, on closing this, we want to clear the data - well, it will be closed anyhow

    // TODO have to react to logged in data

    authStatusProvider.addListener(() {
      if (authStatusProvider.isLoggedIn) {
// this should call some function load current user, start loading and such
        log('we are logged in');
        return;
      }

      log('we are not logged in');
    });
  }

  // final PlayersUseCases _playersUseCases;
  final AuthStatusProvider _authStatusProvider;

  Future<void> _onLoggedIn() {}
}
