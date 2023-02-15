part of 'cubit.dart';

@freezed
class InitialDataCubitState with _$InitialDataCubitState {
  factory InitialDataCubitState.initial() = InitialDataCubitStateInitial;
  factory InitialDataCubitState.failure(String message) =
      InitialDataCubitStateFailure;
}
