part of 'cubit.dart';

@freezed
class MatchJoinCubitState with _$MatchJoinCubitState {
  factory MatchJoinCubitState.initial() = MatchJoinCubitStateInitial;
  factory MatchJoinCubitState.loading() = MatchJoinCubitStateLoading;
  factory MatchJoinCubitState.success() = MatchJoinCubitStateSuccess;
  factory MatchJoinCubitState.failure({
    required String message,
  }) = MatchJoinCubitStateFailure;
}
