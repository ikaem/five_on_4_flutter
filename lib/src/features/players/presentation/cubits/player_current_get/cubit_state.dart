part of 'cubit.dart';

@freezed
class PlayerCurrentGetCubitState with _$PlayerCurrentGetCubitState {
  factory PlayerCurrentGetCubitState.initial() =
      PlayerCurrentGetCubitStateInitial;
  factory PlayerCurrentGetCubitState.loading() =
      PlayerCurrentGetCubitStateLoading;
  factory PlayerCurrentGetCubitState.success() =
      PlayerCurrentGetCubitStateSuccess;
  factory PlayerCurrentGetCubitState.notFound() =
      PlayerCurrentGetCubitStateNotFound;
  factory PlayerCurrentGetCubitState.failure(String message) =
      PlayerCurrentGetCubitStateFailure;
}
