// TODO this is temp only - we will have one that uses firebase to get data
import 'package:collection/collection.dart';
import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_join/match_join.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/exceptions/exceptions.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';

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
        _matches.firstWhereOrNull((element) => element.id == args.matchId);

    if (matchRemoteDTO == null)
      throw HttpNotFoundException(message: 'No such match');

    final bool isUserAlreadyJoined =
        matchRemoteDTO.participants.any((p) => p == args.userId);

    if (isUserAlreadyJoined) {
      throw HttpBadRequestException(message: 'User is already joined');
    }

    final List<MatchParticipantRemoteDTO> updatedParticipants = [
      ...matchRemoteDTO.participants,
      args.userId
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
        updatedParticipants.firstWhereOrNull((p) => p == args.userId);

    if (player == null) {
      throw HttpBadRequestException(message: 'User is already unjoined');
    }

    updatedParticipants.remove(player);

    final MatchRemoteDTO updatedMatch =
        matchRemoteDTO.copyWith(participants: updatedParticipants);

    final int matchLocation =
        _matches.indexWhere((match) => matchRemoteDTO == match);

    _matches[matchLocation] = updatedMatch;
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
