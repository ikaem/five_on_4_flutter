part of 'cubit.dart';

// @freezed
// class MatchCreateCubitState with _$MatchCreateCubitState {
//   factory MatchCreateCubitState.initial() = MatchCreateCubitStateInitial;
//   factory MatchCreateCubitState.nameField([FormFieldError? error]) =
//       MatchCreateCubitStateNameField;
//   factory MatchCreateCubitState.organizerField([FormFieldError? error]) =
//       MatchCreateCubitStateOrganizerField;
//   factory MatchCreateCubitState.timeAndDateField([FormFieldError? error]) =
//       MatchCreateCubitStateTimeAndDateField;
//   factory MatchCreateCubitState.locationField([FormFieldError? error]) =
//       MatchCreateCubitStateLocationField;
//   factory MatchCreateCubitState.loading() = MatchCreateCubitStateLoading;
//   factory MatchCreateCubitState.success() = MatchCreateCubitStateSuccess;
// }

// TODO test

@freezed
class MatchCreateCubitState with _$MatchCreateCubitState {
  const factory MatchCreateCubitState({
    @Default(false) bool isLoading,
    bool? isSuccess,
    FormFieldError? nameError,
    FormFieldError? organizerError,
    FormFieldError? timeAndDateError,
    FormFieldError? locationError,
  }) = _MatchCreateCubitState;

  // TODO we could have a state here for - error, success, loading - do test it eventually
  // but if we do this, we lose state if we want to return, from and error? or do we? we dont if we dont keep the inputs values in the bloc, but isntead keep it isnide the controllers
}
