part of 'cubit.dart';

@freezed
class MatchGetMyNextCubitState with _$MatchGetMyNextCubitState {
  factory MatchGetMyNextCubitState.initial() = MatchGetMyNextCubitStateInitial;
  factory MatchGetMyNextCubitState.loading() = MatchGetMyNextCubitStateLoading;
  factory MatchGetMyNextCubitState.success({
    required MatchInfoModel match,
  }) = MatchGetMyNextCubitStateSuccess;
  factory MatchGetMyNextCubitState.failure({
    required String message,
  }) = MatchGetMyNextCubitStateFailure;
}
