// TODO this is temp only - we will have one that uses firebase to get data
import 'package:collection/collection.dart';
import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_join/match_join.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_participants_invite/args.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/exceptions/exceptions.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/fake_data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/dtos/dtos.dart';

class MatchesRemoteFakeDataSource implements MatchesRemoteDataSource {
  @override
  Future<MatchRemoteDTO> getMatch(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // TODO: implement getMatch
    final MatchRemoteDTO? dto =
        _matches.firstWhereOrNull((match) => match.id == id);

    if (dto == null) throw MatchesRemoteNotFoundException();

    return dto;
  }

  @override
  Future<List<MatchRemoteDTO>> getMatches() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final List<MatchRemoteDTO> dtos = _matches;

    return dtos;
  }

  @override
  Future<String> createMatch(NewMatchValue newMatch) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final String id = _matches.length.toString();

    final MatchRemoteDTO newDto =
        MatchRemoteDTO(id: id, name: 'Created match nr. $id', participants: []);

    _matches.add(newDto);

    return id;
  }

  @override
  Future<void> joinMatch(MatchJoinArgs args) async {
    await Future.delayed(Duration(milliseconds: 500));

    // TODO this check will be done on backend later

    final MatchRemoteDTO? matchRemoteDTO =
        _matches.firstWhereOrNull((match) => match.id == args.matchId);

    if (matchRemoteDTO == null)
      throw HttpNotFoundException(message: 'No such match');

    final PlayerRemoteDTO? playerRemoteDTO =
        players.firstWhereOrNull((player) => player.id == args.playerId);

    if (playerRemoteDTO == null) {
      throw HttpBadRequestException(message: 'Player does not exist');
    }

// TODO remplčace userId on participant to player id
    final bool isUserAlreadyJoined =
        matchRemoteDTO.participants.any((p) => p.userId == playerRemoteDTO.id);

    if (isUserAlreadyJoined) {
      throw HttpBadRequestException(message: 'Player has already joined');
    }

    final MatchParticipantRemoteDTO matchParticipantRemoteDTO =
        MatchParticipantRemoteDTO.fromPlayerRemoteDTO(
      id: matchRemoteDTO.participants.length.toString(),
      matchId: args.matchId,
      playerRemoteDTO: playerRemoteDTO,
    );

    final List<MatchParticipantRemoteDTO> updatedParticipants = [
      ...matchRemoteDTO.participants,
      matchParticipantRemoteDTO,
    ];

    final MatchRemoteDTO updatedMatch =
        matchRemoteDTO.copyWith(participants: updatedParticipants);

    final int matchLocation =
        _matches.indexWhere((match) => matchRemoteDTO == match);

    _matches[matchLocation] = updatedMatch;
  }

  @override
  Future<void> unjoinMatch(MatchJoinArgs args) async {
    await Future.delayed(Duration(milliseconds: 500));

    final MatchRemoteDTO? matchRemoteDTO =
        _matches.firstWhereOrNull((element) => element.id == args.matchId);

    if (matchRemoteDTO == null)
      throw HttpNotFoundException(message: 'No such match');

    final List<MatchParticipantRemoteDTO> updatedParticipants = [
      ...matchRemoteDTO.participants,
    ];

    final MatchParticipantRemoteDTO? player =
        updatedParticipants.firstWhereOrNull((p) => p.userId == args.playerId);

    if (player == null) {
      throw HttpBadRequestException(message: 'User is already unjoined');
    }

// TODO not sure if this would work
    updatedParticipants.remove(player);

    final MatchRemoteDTO updatedMatch =
        matchRemoteDTO.copyWith(participants: updatedParticipants);

    final int matchLocation =
        _matches.indexWhere((match) => matchRemoteDTO == match);

    _matches[matchLocation] = updatedMatch;
  }

  @override
  Future<void> inviteToMatch(MatchParticipantsInviteArgs args) {
    // TODO: implement inviteToMatch
    throw UnimplementedError();
  }
}

// TODO temp only
final List<MatchRemoteDTO> _matches = [
  const MatchRemoteDTO(id: '2', name: 'Some match name 2', participants: []),
  const MatchRemoteDTO(id: '3', name: 'Some match name 3', participants: []),
  const MatchRemoteDTO(id: '4', name: 'Some match name 4', participants: []),
  const MatchRemoteDTO(id: '5', name: 'Some match name 5', participants: []),
  const MatchRemoteDTO(id: '6', name: 'Some match name 6', participants: []),
  const MatchRemoteDTO(id: '7', name: 'Some match name 7', participants: []),
];
