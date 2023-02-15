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
    try {
      _initialDataProvider.isLoading = true;
      _initialDataSubscription = _initialDataUseCases.initialDataStream.listen(
        _handleInitialDataEvent,
        // TODO not sure if error will propagate to catch bloc
        // if no propagation, maybe use await for to handle this - or create an error handler to handle it, - but then on auth check on app start can fail
        // onError: (Object e) {
        //   emit(
        //     InitialDataCubitState.failure(
        //         'There was an error retrieving initial data'),
        //   );
        // },
      );

      await _initialDataUseCases.onAuthCheckOnAppStart();
    } catch (e) {
      emit(
        InitialDataCubitStateFailure(
            'There was an error retrieving initial data'),
      );
      await _initialDataUseCases.initialDataClear();
    }
  }

  Future<void> _handleInitialDataEvent(InitialDataValue initialData) async {
    final AuthModel? auth = initialData.auth;

// if this fails, we want to logout
    if (auth != null) await _initialDataUseCases.onLoadCurrentPlayer(auth.id);
    _initialDataProvider.setInitialData(
      auth: initialData.auth,
      player: initialData.currentPlayer,
    );
  }

  @override
  Future<void> close() async {
    _initialDataSubscription.cancel();
    await super.close();
  }
}
