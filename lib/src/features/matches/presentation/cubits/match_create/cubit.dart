import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_4_flutter/src/utils/mixins/validation_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

class MatchCreateCubit extends Cubit<MatchCreateCubitState>
    with ValidationMixin {
  MatchCreateCubit({
    required this.matchesUseCases,
  }) : super(const MatchCreateCubitState());

  final MatchesUseCases matchesUseCases;

  MatchCreateCubitState get _initialState => state;

  void onChangeName(
    String value,
  ) {
    // TODO some validation goes here - with help of that mixin

    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    FormFieldError? nameError;
    if (isEmpty) {
      nameError = FormFieldError.empty;
    } else if (!isValid) {
      nameError = FormFieldError.invalid;
    }

    final currentState = state.copyWith(nameError: nameError);

    emit(currentState);
  }

// TODO this is not changable - should not be part of the thing
  void onChangeOrganizer(
    String value,
  ) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    FormFieldError? organizerError;
    if (isEmpty) {
      organizerError = FormFieldError.empty;
    } else if (!isValid) {
      organizerError = FormFieldError.invalid;
    }

    final currentState = state.copyWith(organizerError: organizerError);

    emit(currentState);
  }

  void onChangeTimeAndDate(
    String value,
  ) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    FormFieldError? timeAndDateError;
    if (isEmpty) {
      timeAndDateError = FormFieldError.empty;
    } else if (!isValid) {
      timeAndDateError = FormFieldError.invalid;
    }

    final currentState = state.copyWith(timeAndDateError: timeAndDateError);

    emit(currentState);
  }

  void onChangeLocation(
    String value,
  ) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    FormFieldError? locationError;
    if (isEmpty) {
      locationError = FormFieldError.empty;
    } else if (!isValid) {
      locationError = FormFieldError.invalid;
    }

    final currentState = state.copyWith(locationError: locationError);

    emit(currentState);
  }

  Future<void> onSubmit(
    // TODO this might not be good to come as nwe match value - because we could have different data types in there
    NewMatchValue newMatch,
  ) async {
    // TODO ALL needs to be validated now
    // TODO extract this into a function of some sort - maybe even some validator outside of this
    // TODO we have repeating here
    // TODO we could have validator to validate all fields in that mixin
    final bool isNameEmpty = isFieldEmpty(newMatch.name);
    final bool isNameValid = isFieldEmpty(newMatch.name);
    FormFieldError? nameError;
    if (isNameEmpty) {
      nameError = FormFieldError.empty;
    } else if (!isNameValid) {
      nameError = FormFieldError.invalid;
    }

    final bool isOrganizerEmpty = isFieldEmpty(newMatch.organizer);
    final bool isOrganizerValid = isFieldEmpty(newMatch.organizer);
    FormFieldError? organizerError;
    if (isOrganizerEmpty) {
      organizerError = FormFieldError.empty;
    } else if (!isOrganizerValid) {
      organizerError = FormFieldError.invalid;
    }

// TODO will need some better validator here - like, if time and date is provided, and if it is in some reasonable period
    // final bool isTimeAndDateEmpty = isFieldEmpty(newMatch.timeAndDate);
    // final bool isTimeAndDateValid = isFieldEmpty(newMatch.timeAndDate);
    // FormFieldError? timeAndDateError;
    // if (isTimeAndDateEmpty) {
    //   timeAndDateError = FormFieldError.empty;
    // } else if (!isTimeAndDateValid) {
    //   timeAndDateError = FormFieldError.invalid;
    // }

    final bool isLocationEmpty = isFieldEmpty(newMatch.location);
    final bool isLocationValid = isFieldEmpty(newMatch.location);
    FormFieldError? locationError;
    if (isLocationEmpty) {
      locationError = FormFieldError.empty;
    } else if (!isLocationValid) {
      locationError = FormFieldError.invalid;
    }

    final bool isFormValid =
        locationError == null && organizerError == null && nameError == null;

    if (!isFormValid) {
      final MatchCreateCubitState errorsState = state.copyWith(
        locationError: locationError,
        nameError: nameError,
        organizerError: organizerError,
        // TODO dont forget time and date
      );

      emit(errorsState);

      return;
    }

    // TODO questionable which layer should build the arguments

    final MatchCreateCubitState loadingState = state.copyWith(isLoading: true);
    emit(loadingState);

    try {
      await matchesUseCases.createMatch(newMatch);

// TODO note the issue with having one state here - we have to cancel loading manually
      final MatchCreateCubitState successState =
          state.copyWith(isLoading: false, isSuccess: true);

      emit(successState);
    } catch (e) {
      // TODO again, have to manually cancel laoding - and dont have option to provide error data - unless we have a message there
      // TODO if we keep it like this, we should probably add some error message thing - to
      final MatchCreateCubitState failureState =
          state.copyWith(isLoading: false, isSuccess: false);

      emit(failureState);

      // TODO we could use that initial state - but then we lose errors too
    }
  }

  // TODO this is for testing only - these functions should live somewhere in some class for validation methods - some helpers or something
  // TODO need some state for holding all items that are invalid
}

// TODO this could be a cubit
// class MatchCreateCubit extends Cubit<MatchCreateCubitState>
//     with ValidationMixin {
//   MatchCreateCubit({
//     required this.matchesUseCases,
//   }) : super(MatchCreateCubitStateInitial());

//   final MatchesUseCases matchesUseCases;

//   void onChangeName(
//     String value,
//   ) {
//     // TODO some validation goes here - with help of that mixin

//     final bool isEmpty = isFieldEmpty(value);
//     final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

//     if (isEmpty) emit(MatchCreateCubitStateNameField(FormFieldError.empty));
//     if (!isValid) emit(MatchCreateCubitStateNameField(FormFieldError.invalid));

//     emit(MatchCreateCubitStateNameField());
//   }

// // TODO this is not changable - should not be part of the thing
//   void onChangeOrganizer(
//     String value,
//   ) {
//     // TODO some validation goes here - with help of that mixin

//     final bool isEmpty = isFieldEmpty(value);
//     final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

//     if (isEmpty) {
//       emit(MatchCreateCubitStateOrganizerField(FormFieldError.empty));
//     }
//     if (!isValid) {
//       emit(MatchCreateCubitStateOrganizerField(FormFieldError.invalid));
//     }

//     emit(MatchCreateCubitStateOrganizerField());
//   }

//   void onChangeTimeAndDate(
//     String value,
//   ) {
//     // TODO some validation goes here - with help of that mixin

//     final bool isEmpty = isFieldEmpty(value);
//     final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

//     if (isEmpty) {
//       emit(MatchCreateCubitStateTimeAndDateField(FormFieldError.empty));
//     }
//     if (!isValid) {
//       emit(MatchCreateCubitStateTimeAndDateField(FormFieldError.invalid));
//     }

//     emit(MatchCreateCubitStateTimeAndDateField());
//   }

//   void onChangeLocation(
//     String value,
//   ) {
//     // TODO some validation goes here - with help of that mixin

//     final bool isEmpty = isFieldEmpty(value);
//     final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

//     if (isEmpty) emit(MatchCreateCubitStateLocationField(FormFieldError.empty));
//     if (!isValid) {
//       emit(MatchCreateCubitStateLocationField(FormFieldError.invalid));
//     }

//     emit(MatchCreateCubitStateLocationField());
//   }

//   // TODO this is for testing only - these functions should live somewhere in some class for validation methods - some helpers or something
//   // TODO need some state for holding all items that are invalid
// }

bool _validateRegularFieldForTesting(String value) => true;
