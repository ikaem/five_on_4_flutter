part of 'cubit.dart';

@freezed
class MatchCreateCubitState with _$MatchCreateCubitState {
  factory MatchCreateCubitState.initial() = MatchCreateCubitStateInitial;
  factory MatchCreateCubitState.loading() = MatchCreateCubitStateLoading;
  factory MatchCreateCubitState.failure(String message) =
      MatchCreateCubitStateFailure;
  factory MatchCreateCubitState.success(String matchId) =
      MatchCreateCubitStateSuccess;
}
