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
  });

  factory MatchLocalDTO.fromRemoteDto(MatchRemoteDTO remoteDto) {
    final MatchLocalDTO localDto =
        MatchLocalDTO(id: remoteDto.id, name: remoteDto.name);

    return localDto;
  }

  Id get isarId => fastHash(id);

  final String id;
  final String name;
}
