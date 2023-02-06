part of 'cubit.dart';

@freezed
class LoginCubitState with _$LoginCubitState {
  factory LoginCubitState.initial() = LoginCubitStateInitial;
  factory LoginCubitState.loading() = LoginCubitStateLoading;
  factory LoginCubitState.failure(String message) = LoginCubitStateFailure;
  factory LoginCubitState.success() = LoginCubitStateSuccess;
}
