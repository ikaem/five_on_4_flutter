part of 'bloc.dart';

@freezed
class MatchesGetMyAllBlocEvent with _$MatchesGetMyAllBlocEvent {
  factory MatchesGetMyAllBlocEvent.loadMatches() =
      MatchesGetMyAllBlocLoadMatchesEvent;
}
