part of 'cubit.dart';

@freezed
class LogoutCubitState with _$LogoutCubitState {
  factory LogoutCubitState.initial() = LogoutCubitStateInitial;
  factory LogoutCubitState.loading() = LogoutCubitStateLoading;
  factory LogoutCubitState.failure(String message) = LogoutCubitStateFailure;
  factory LogoutCubitState.success() = LogoutCubitStateSuccess;
}
