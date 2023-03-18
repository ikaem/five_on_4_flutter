import 'package:five_on_4_flutter/src/features/auth/data/repositories/repositories.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/data/repositories/matches_repository/matches_repository.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_participants_invitations/args.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_4_flutter/src/features/players/data/repositories/repository.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';

class MatchesUseCases {
  const MatchesUseCases({
    required this.matchesRepository,
    required this.authRepository,
    required this.playersRepository,
  });

  final MatchesRepository matchesRepository;
  final AuthRepository authRepository;
  final PlayersRepository playersRepository;

  Future<void> invitePlayersToMatch({
    required String matchId,
    required List<PlayerModel> players,
  }) async {
    final List<MatchParticipantInviteArgs> participantsArgs =
        players.map(MatchParticipantInviteArgs.fromPlayerModel).toList();

    final MatchParticipantsInvitationsArgs matchParticipantsInviteArgs =
        MatchParticipantsInvitationsArgs(
      participantsArgs: participantsArgs,
      matchId: matchId,
    );

    await matchesRepository.invitePlayersToMatch(matchParticipantsInviteArgs);
  }

  Future<void> participateInMatch({
    required String matchId,
    required bool shouldJoin,
  }) async {
    // final AuthModel? auth = await authRepository.auth;
    final PlayerModel? currentPlayer = await playersRepository.currentPlayer;
    // TODO not sure if this should be error to throw
    if (currentPlayer == null) throw AuthNoSessionException();

    final String playerId = currentPlayer.id;
    final String playerNickname = currentPlayer.nickname;

    final MatchJoinArgs matchJoinArgs = MatchJoinArgs(
      playerId: playerId,
      playerNickname: playerNickname,
      matchId: matchId,
    );

    shouldJoin
        ? await matchesRepository.joinMatch(matchJoinArgs)
        : await matchesRepository.unjoinMatch(matchJoinArgs);

    // get auth
    // if not auth, send no auth error // in bloc listener, react to auth error - whcih could be field on failure and
  }

  // TODO not sure if these should be divided - todays matches, and all matches - this would mean we would have two blocs? but maybe we could have some different stats and such - lets play with it

// TODO this should probably return paginated class of some sort
// TODO ALSO, this function can maybe be unified later with some general gunction - and just pass it date period, and if matches are for me
  Future<List<MatchModel>> getMyTodaysMatches() async {
/* TODO this probably needs to be formatted to remove time, and just include todays data  */
// TODO will need to use this in future
    final String today = DateTime.now().toIso8601String();
    final String tomorrow =
        DateTime.now().add(const Duration(days: 1)).toIso8601String();

// TODO arguments here would be period i guess - make sure it gets these arguments later
    final List<MatchModel> matches = await matchesRepository.getMatches();

    return matches;
  }

  Future<List<MatchModel>> getMyAllMatches() async {
/* TODO this probably needs to be formatted to remove time, and just include todays data  */
// TODO will need to use this in future
    final String tomorrow =
        DateTime.now().add(const Duration(days: 1)).toIso8601String();

// TODO arguments here would be period i guess - make sure it gets these arguments later
    final List<MatchModel> matches = await matchesRepository.getMatches();

    return matches;
  }

  Future<MatchModel> getMatch(String id) async {
    final MatchModel match = await matchesRepository.getMatch(id);

    return match;
  }

  Future<String> createMatch(NewMatchValue newMatch) async {
    final String id = await matchesRepository.createMatch(newMatch);

    return id;
  }

  Future<List<MatchModel>> getMyInvitedMatches() async {
    final PlayerModel? currentPlayer = await playersRepository.currentPlayer;
    // TODO not sure if this should be error to throw
    if (currentPlayer == null) throw AuthNoSessionException();

    final String playerId = currentPlayer.id;

    final List<MatchModel> matches =
        await matchesRepository.getInvitedMatches(playerId);

    return matches;
  }
}
