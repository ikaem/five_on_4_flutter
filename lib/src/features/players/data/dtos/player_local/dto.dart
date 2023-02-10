import 'package:five_on_4_flutter/src/utils/helpers/fast_hash.dart';
import 'package:isar/isar.dart';

part 'dto.g.dart';

@Collection()
class PlayerLocalDTO {
  const PlayerLocalDTO({
    required this.id,
    required this.authId,
    required this.nickname,
    required this.email,
  });

  Id get isarId => fastHash(id);

  final String id;
  final String authId;
  final String nickname;
  final String email;
}
