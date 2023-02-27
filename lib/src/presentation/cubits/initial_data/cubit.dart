import 'dart:async';

import 'package:five_on_4_flutter/src/domain/use_cases/initial_data/use_cases.dart';
import 'package:five_on_4_flutter/src/domain/values/initial_data/value.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/auth.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:five_on_4_flutter/src/presentation/providers/providers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

// TODO this could be called something like SessionDataCubit
class InitialDataCubit extends Cubit<InitialDataCubitState> {
  InitialDataCubit({
    required InitialDataUseCases initialDataUseCases,
  })  : _initialDataUseCases = initialDataUseCases,
        super(InitialDataCubitStateInitial()) {
    _onInitializeCubit();
  }

  final InitialDataUseCases _initialDataUseCases;

  final InitialDataProvider _initialDataProvider = InitialDataProvider();
  late final StreamSubscription<InitialDataValue> _initialDataSubscription;

  AuthModel? get auth => _initialDataProvider.auth;
  PlayerModel? get currentPlayer => _initialDataProvider.currentPlayer;
  InitialDataProvider get initialDataProvider => _initialDataProvider;

  Future<void> clearInitialData() async {
    try {
      await _initialDataUseCases.initialDataClear();
    } catch (e) {
      emit(
        InitialDataCubitState.failure(
            'There was an error clearing initial data'),
      );
    }
  }

  Future<void> _onInitializeCubit() async {
    // _initialDataUseCases.authStream.listen((event) {
    //   log('any stgream here');
    // });

    // _initialDataUseCases.currentPlayerStream.listen((event) {
    //   log('Current player stream: $event');
    // });

    try {
      _initialDataProvider.isLoading = true;
      // _initialDataSubscription = _initialDataUseCases.initialDataStream.listen(
      //   _handleInitialDataEvent,
      //   onError: (e) async {
      //     // TODO test
      //     log('Todod: $e');
      //     await _initialDataUseCases.initialDataClear();

      //     // TODO test
      //   },
      // );
      // TODO doing this to propagate errors
      // await for (final InitialDataValue initialData
      //     in _initialDataUseCases.initialDataStream) {
      //   // TODO test
      //   // _handleInitialDataEvent(initialData);
      // }

// TODO not sure about this - these are separate things

      await _initialDataUseCases.onAuthCheckOnAppStart();
      await for (var something in _initialDataUseCases.initialDataStream) {
        await _handleInitialDataEvent(something);
      }
    } catch (e) {
      emit(
        InitialDataCubitStateFailure(
            'There was an error retrieving initial data'),
      );
      await _initialDataUseCases.initialDataClear();
    }
  }

  Future<void> _handleInitialDataEvent(InitialDataValue initialData) async {
    // _initialDataProvider.auth = initialData.auth;
    // _initialDataProvider.currentPlayer = initialData.currentPlayer;
    _initialDataProvider.setInitialData(
        auth: initialData.auth, player: initialData.currentPlayer);

    if (_initialDataProvider.auth == null) {
      _initialDataProvider.currentPlayer = null;
      return;
    }

    if (initialDataProvider.currentPlayer == null) {
      try {
        await _initialDataUseCases.onLoadCurrentPlayer(initialData.auth!.id);
      } catch (e) {
        // TODO test
        rethrow;
      }
    }

    // TODO test
  }

  @override
  Future<void> close() async {
    _initialDataSubscription.cancel();
    await super.close();
  }
}
