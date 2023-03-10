part of 'bloc.dart';

@freezed
class MatchesGetMyTodaysBlocState with _$MatchesGetMyTodaysBlocState {
  factory MatchesGetMyTodaysBlocState.initial() =
      MatchesGetMyTodaysBlocStateInitial;
  factory MatchesGetMyTodaysBlocState.loading() =
      MatchesGetMyTodaysBlocStateLoading;
  factory MatchesGetMyTodaysBlocState.success({
    required List<MatchModel> matches,
  }) = MatchesGetMyTodaysBlocStateSuccess;
  factory MatchesGetMyTodaysBlocState.failure({
    required String message,
  }) = MatchesGetMyTodaysBlocStateFailure;
}
