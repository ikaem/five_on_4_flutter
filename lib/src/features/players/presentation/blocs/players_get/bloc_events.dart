part of 'bloc.dart';

@freezed
class PlayersGetBlocEvent with _$PlayersGetBlocEvent {
  // factory PlayersGetBlocEvent.getOne(String id) = PlayerGetBlocEventGetOne;
  factory PlayersGetBlocEvent.getMany() = PlayerGetBlocEventGetMany;
  factory PlayersGetBlocEvent.searchMany(PlayersGetSearchFilters filters) =
      PlayersGetBlocEventSearchMany;
}

// TODO not sure where this would be
// TODO this could be moved to values
@immutable
class PlayersGetSearchFilters {
  const PlayersGetSearchFilters({
    required this.searchTerm,
  });

  final String? searchTerm;
  // TODO these could come in later
  // final int? joinedAt;
}
