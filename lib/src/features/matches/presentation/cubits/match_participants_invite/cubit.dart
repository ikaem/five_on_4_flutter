import 'package:five_on_4_flutter/src/features/matches/domain/args/match_participants_invite/args.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

class MatchParticipantsInviteCubit extends Cubit<MatchParticipantsInviteState> {
  MatchParticipantsInviteCubit({
    required this.matchesUseCases,
  }) : super(MatchParticipantsInviteStateInitial());

  final MatchesUseCases matchesUseCases;

  Future<void> onInviteParticipants(
    MatchParticipantsInviteArgs args,
  ) async {
    emit(MatchParticipantsInviteState.loading());

    try {
      await matchesUseCases.invitePlayersToMatch(args);
    } catch (e) {
      emit(MatchParticipantsInviteStateFailure(
          message: 'There was an error inviting players to the match'));
    }
  }
}
