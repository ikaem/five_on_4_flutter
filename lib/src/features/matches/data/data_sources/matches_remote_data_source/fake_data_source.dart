// TODO this is temp only - we will have one that uses firebase to get data
import 'package:collection/collection.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/exceptions/exceptions.dart';

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
}

// TODO temp only
final List<MatchRemoteDTO> _matches = [
  const MatchRemoteDTO(id: '2', name: 'Some match name 2'),
  const MatchRemoteDTO(id: '3', name: 'Some match name 3'),
  const MatchRemoteDTO(id: '4', name: 'Some match name 4'),
  const MatchRemoteDTO(id: '5', name: 'Some match name 5'),
  const MatchRemoteDTO(id: '6', name: 'Some match name 6'),
  const MatchRemoteDTO(id: '7', name: 'Some match name 7'),
];
