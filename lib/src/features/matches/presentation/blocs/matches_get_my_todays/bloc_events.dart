part of 'bloc.dart';

@freezed
class MatchesGetMyTodaysBlocEvent with _$MatchesGetMyTodaysBlocEvent {
  factory MatchesGetMyTodaysBlocEvent.loadMatches() =
      MatchesGetMyTodaysBlocLoadMatchesEvent;
}
