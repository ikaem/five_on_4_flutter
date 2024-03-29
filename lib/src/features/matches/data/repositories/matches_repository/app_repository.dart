import 'dart:developer';

import 'package:five_on_4_flutter/src/features/matches/data/data.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/data/repositories/matches_repository/matches_repository.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_join/match_join.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_participants_invitations/args.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/models/match/model.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';

class MatchesAppRepository implements MatchesRepository {
  const MatchesAppRepository({
    required this.matchesRemoteDataSource,
    required this.matchesLocalDataSource,
  });

  final MatchesRemoteDataSource matchesRemoteDataSource;
  final MatchesLocalDataSource matchesLocalDataSource;

  @override
  Future<MatchModel> getMatch(String id) async {
// TODO we should
/* 
- get match 
- update database 
- return the match that we received from remote 

 */

    final MatchRemoteDTO remoteDto = await matchesRemoteDataSource.getMatch(id);

    final MatchLocalDTO localDto = MatchLocalDTO.fromRemoteDto(remoteDto);

// TODO an error could happen here - we should handle it in the database wrapper probably
    await matchesLocalDataSource.upsertMatch(localDto);

    final MatchModel match = MatchModel.fromRemoteDto(remoteDto);

    return match;
  }

  @override
  Future<List<MatchModel>> getMatches() async {
    final List<MatchRemoteDTO> remoteDtos =
        await matchesRemoteDataSource.getMatches();

    final List<MatchLocalDTO> localDtos =
        remoteDtos.map((dto) => MatchLocalDTO.fromRemoteDto(dto)).toList();

    await matchesLocalDataSource.upsertMatches(localDtos);

    final List<MatchModel> matches =
        remoteDtos.map((dto) => MatchModel.fromRemoteDto(dto)).toList();

    return matches;
  }

  @override
  Future<String> createMatch(NewMatchValue newMatch) async {
    final String remoteMatchId =
        await matchesRemoteDataSource.createMatch(newMatch);

    // TODO we probably dont want to refetch it again, just to be able to cache it - we will cache it when we get to the page

    return remoteMatchId;
  }

  @override
  Future<void> joinMatch(MatchJoinArgs matchJoinArgs) async {
    await matchesRemoteDataSource.joinMatch(matchJoinArgs);
  }

  @override
  Future<void> unjoinMatch(MatchJoinArgs matchJoinArgs) async {
    await matchesRemoteDataSource.unjoinMatch(matchJoinArgs);
  }

  @override
  Future<void> invitePlayersToMatch(
      MatchParticipantsInvitationsArgs args) async {
    final MatchRemoteDTO remoteMatchDto =
        await matchesRemoteDataSource.getMatch(args.matchId);

    log('This is invited players: ${args.participantsArgs}');
    log('This is match: $remoteMatchDto');

// get match participants
// TODO move this to a function
    final List<MatchParticipantRemoteDTO> existingParticipants =
        remoteMatchDto.participants;

    // final Map<String, bool> invitedPlayersMap = Map.fromIterable(
    //   args.playersIds,
    //   key: (element) => element as String,
    //   value: (element) => true,
    // );

    final Map<String, bool> existingPlayersMap = {
      for (final existingParticipant in existingParticipants)
        existingParticipant.userId: true
    };

    List<MatchParticipantInviteArgs> filteredParticipantsForInvite =
        args.participantsArgs.where((player) {
      if (existingPlayersMap.containsKey(player)) {
        log('Player $player has already been invited to the match');

        return false;
      }

      return true;
    }).toList();

    final MatchParticipantsInvitationsArgs invitationsArgs =
        MatchParticipantsInvitationsArgs(
      participantsArgs: filteredParticipantsForInvite,
      matchId: args.matchId,
    );

    await matchesRemoteDataSource.inviteToMatch(invitationsArgs);

// check if any of invited players has already been invited or declined or something

// then add multiple subcollection items
  }

  Future<List<MatchModel>> getInvitedMatches(String playerId) async {
    final List<MatchRemoteDTO> matchesDTOs =
        await matchesRemoteDataSource.getInvitedMatches(playerId);

    final List<MatchModel> matches =
        matchesDTOs.map((e) => MatchModel.fromRemoteDto(e)).toList();

    return matches;
  }
}
