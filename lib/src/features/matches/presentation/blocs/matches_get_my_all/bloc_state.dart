part of 'bloc.dart';

// TODO lot of duplication here - same as for my todays matches
@freezed
class MatchesGetMyAllBlocState with _$MatchesGetMyAllBlocState {
  factory MatchesGetMyAllBlocState.initial() = MatchesGetMyAllBlocStateInitial;
  factory MatchesGetMyAllBlocState.loading() = MatchesGetMyAllBlocStateLoading;
  factory MatchesGetMyAllBlocState.success({
    required List<MatchModel> matches,
  }) = MatchesGetMyAllBlocStateSuccess;
  factory MatchesGetMyAllBlocState.failure({
    required String message,
  }) = MatchesGetMyAllBlocStateFailure;
}
