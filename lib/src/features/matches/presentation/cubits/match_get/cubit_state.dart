part of 'cubit.dart';

@freezed
class MatchGetCubitState with _$MatchGetCubitState {
  factory MatchGetCubitState.initial() = MatchGetCubitStateInitial;
  factory MatchGetCubitState.loading() = MatchGetCubitStateLoading;
  factory MatchGetCubitState.success({
    required MatchModel match,
  }) = MatchGetCubitStateSuccess;
  factory MatchGetCubitState.failure({
    required String message,
  }) = MatchGetCubitStateFailure;
}
