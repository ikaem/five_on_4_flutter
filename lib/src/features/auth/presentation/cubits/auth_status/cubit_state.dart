part of 'cubit.dart';

@freezed
class AuthStatusCubitState with _$AuthStatusCubitState {
  factory AuthStatusCubitState.initial() = AuthStatusCubitStateInitial;
  factory AuthStatusCubitState.failure(String message) =
      AuthStatusCubitStateFailure;
}
