part of 'cubit.dart';

@freezed
class RegisterCubitState with _$RegisterCubitState {
  factory RegisterCubitState.initial() = RegisterCubitStateInitial;
  factory RegisterCubitState.loading() = RegisterCubitStateLoading;
  factory RegisterCubitState.failure(String message) =
      RegisterCubitStateFailure;
  factory RegisterCubitState.success() = RegisterCubitStateSuccess;
}
