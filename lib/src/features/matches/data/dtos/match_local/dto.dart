import 'package:five_on_4_flutter/src/features/matches/data/data.dart';
import 'package:five_on_4_flutter/src/utils/helpers/fast_hash.dart';
import 'package:isar/isar.dart';

part 'dto.g.dart';

// TODO using this solution to have string id - this is so we can provide string as aid
// https://github.com/isar/isar/discussions/344#discussioncomment-2619889

// this could also be good - https://isar.dev/recipes/string_ids.html
@Collection()
class MatchLocalDTO {
  const MatchLocalDTO({
    required this.id,
    required this.name,
    required this.players,
  });

  factory MatchLocalDTO.fromRemoteDto(MatchRemoteDTO remoteDto) {
    final MatchLocalDTO localDto = MatchLocalDTO(
      id: remoteDto.id,
      name: remoteDto.name,
      players: remoteDto.players,
    );

    return localDto;
  }

  Id get isarId => fastHash(id);

  final String id;
  final String name;
  // TODO this will need to be objects - but how to store this - should this be stored separately into its own table, or set it as a list into tghis collection
  final List<String> players;
}
