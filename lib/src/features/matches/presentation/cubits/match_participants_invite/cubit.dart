import 'dart:async';

import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

class MatchParticipantsInviteCubit
    extends Cubit<MatchParticipantsInviteCubitState> {
  MatchParticipantsInviteCubit({
    required this.matchesUseCases,
  }) : super(MatchParticipantsInviteCubitStateInitial());

  final MatchesUseCases matchesUseCases;

  final BehaviorSubject<List<PlayerModel>> _playersForInvitationSubject =
      BehaviorSubject.seeded([]);

  StreamSink<List<PlayerModel>> get _playersForInvitationSink =>
      _playersForInvitationSubject.sink;
  Stream<List<PlayerModel>> get playersForInvitationStream =>
      _playersForInvitationSubject.stream;

  // handle change now
  void onAddPlayer(PlayerModel player) {
    // TODO this is cool - we dont have to await
    final List<PlayerModel> players = _playersForInvitationSubject.value;

    players.add(player);
    _playersForInvitationSink.add(players);
  }

  void onRemovePlayer(PlayerModel player) {
    // TODO this is cool - we dont have to await
    final List<PlayerModel> players = _playersForInvitationSubject.value;

    players.remove(player);
    _playersForInvitationSink.add(players);
  }

  Future<void> onInviteParticipants(
    // MatchParticipantsInviteArgs args,
    String matchId,
  ) async {
    emit(MatchParticipantsInviteCubitStateLoading());

    try {
      await matchesUseCases.invitePlayersToMatch(
        players: _playersForInvitationSubject.value,
        matchId: matchId,
      );

      emit(MatchParticipantsInviteCubitStateSuccess(matchId));
    } catch (e) {
      emit(MatchParticipantsInviteCubitStateFailure(
          message: 'There was an error inviting players to the match'));
    }
  }
}
