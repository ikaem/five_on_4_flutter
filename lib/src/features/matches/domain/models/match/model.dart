// TODO later, use freezed for this
import 'package:five_on_4_flutter/src/features/matches/data/data.dart';

class MatchModel {
  const MatchModel({
    required this.id,
    required this.name,
  });
  factory MatchModel.fromRemoteDto(MatchRemoteDTO remoteDto) {
    final MatchModel match = MatchModel(id: remoteDto.id, name: remoteDto.name);

    return match;
  }

  final String id;
  final String name;
}
