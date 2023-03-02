import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:five_on_4_flutter/src/features/players/domain/use_cases/players_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_events.dart';
part 'bloc_state.dart';
part 'bloc.freezed.dart';

class PlayersGetBloc extends Bloc<PlayersGetBlocEvent, PlayersGetBlocState> {
  PlayersGetBloc({
    required this.playersUseCases,
  }) : super(PlayerGetBlocStateInitial()) {
    _registerEventHandlers();
  }

  final PlayersUseCases playersUseCases;

  void _registerEventHandlers() {
    // on<PlayerGetBlocEventGetOne>(_onGetOne);
    on<PlayerGetBlocEventGetMany>(_onGetMany);
    on<PlayersGetBlocEventSearchMany>(_onSearchMany);
  }

  // Future<void> _onGetOne(
  //   PlayerGetBlocEventGetOne event,
  //   Emitter<PlayersGetBlocState> emitter,
  // ) async {
  //   emitter(PlayerGetBlocStateLoading());

  //   try {} catch (e) {}
  // }

  Future<void> _onGetMany(
    PlayerGetBlocEventGetMany event,
    Emitter<PlayersGetBlocState> emitter,
  ) async {
    emitter(PlayerGetBlocStateLoading());

    try {} catch (e) {}
  }

  Future<void> _onSearchMany(
    PlayersGetBlocEventSearchMany event,
    Emitter<PlayersGetBlocState> emitter,
  ) async {
    emitter(PlayerGetBlocStateLoading());

    // we should have some stream transformer here on stream from use cases

    try {
      // we should go with emitter.when
      // emitter.onEach(stream, onData: emitter);
    } catch (e) {}

    // we could get stream of events here from use case
  }
}
