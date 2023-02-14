part of 'cubit.dart';

@freezed
class PlayerCurrentCubitState with _$PlayerCurrentGetCubitState {
  factory PlayerCurrentCubitState.initial() = PlayerCurrentGetCubitStateInitial;
  factory PlayerCurrentCubitState.loading() = PlayerCurrentGetCubitStateLoading;
  factory PlayerCurrentCubitState.success() = PlayerCurrentGetCubitStateSuccess;
  factory PlayerCurrentCubitState.notFound() =
      PlayerCurrentGetCubitStateNotFound;
  factory PlayerCurrentCubitState.failure(String message) =
      PlayerCurrentGetCubitStateFailure;
}
