part of 'cubit.dart';

@freezed
class AuthStatusCubitState with _$AuthStatusCubitState {
  factory AuthStatusCubitState.initial() = _AuthStatusCubitStateInitial;
  factory AuthStatusCubitState.success() = _AuthStatusCubitStateSuccess;
  factory AuthStatusCubitState.failure(String message) =
      _AuthStatusCubitStateFailure;
}
