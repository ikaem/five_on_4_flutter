import 'dart:async';

import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/new_match.dart';
import 'package:five_on_4_flutter/src/utils/mixins/validation_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

MatchCreateCubitState get _initialState => MatchCreateCubitStateInitial();

class MatchCreateCubit extends Cubit<MatchCreateCubitState>
    with ValidationMixin {
  MatchCreateCubit({
    required this.matchesUseCases,
  }) : super(_initialState);

  final MatchesUseCases matchesUseCases;

// TODO temp disabled to not show error immeidately when open page
  // final BehaviorSubject<String> _nameSubject = BehaviorSubject.seeded('');
  final BehaviorSubject<String> _nameSubject = BehaviorSubject();
  final BehaviorSubject<String> _organizerSubject = BehaviorSubject();
  final BehaviorSubject<String> _timeAndDateSubject = BehaviorSubject();
  final BehaviorSubject<String> _locationSubject = BehaviorSubject();

  StreamSink<String> get _nameSink => _nameSubject.sink;
  StreamSink<String> get _organizerSink => _organizerSubject.sink;
  StreamSink<String> get _timeAndDateSink => _timeAndDateSubject.sink;
  StreamSink<String> get _locationSink => _locationSubject.sink;

  Stream<String> get nameStream =>
      _nameSubject.stream.transform(_nameValidationTransformer);
  Stream<String> get locationStream =>
      _locationSubject.stream.transform(_locationValidationTransformer);
  Stream<String> get timeAndDateStream =>
      _timeAndDateSubject.stream.transform(_timeAndDateValidationTransformer);
  Stream<String> get organizerStream =>
      _organizerSubject.stream.transform(_organizerValidationTransformer);

  Stream<bool> get inputsValidationStream => Rx.combineLatest4(
        nameStream,
        locationStream,
        timeAndDateStream,
        organizerStream,
        (a, b, c, d) => true,
      );

  void onChangeName(
    String value,
  ) {
    _nameSink.add(value);
    // TODO some validation goes here - with help of that mixin

    // final bool isEmpty = isFieldEmpty(value);
    // final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    // FormFieldError? nameError;
    // if (isEmpty) {
    //   nameError = FormFieldError.empty;
    // } else if (!isValid) {
    //   nameError = FormFieldError.invalid;
    // }

    // final currentState = state.copyWith(nameError: nameError);

    // emit(currentState);
  }

// TODO this is not changable - should not be part of the thing
  void onChangeOrganizer(
    String value,
  ) {
    _organizerSink.add(value);

    // final bool isEmpty = isFieldEmpty(value);
    // final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    // FormFieldError? organizerError;
    // if (isEmpty) {
    //   organizerError = FormFieldError.empty;
    // } else if (!isValid) {
    //   organizerError = FormFieldError.invalid;
    // }

    // final currentState = state.copyWith(organizerError: organizerError);

    // emit(currentState);
  }

  void onChangeTimeAndDate(
    String value,
  ) {
    _timeAndDateSink.add(value);
    // final bool isEmpty = isFieldEmpty(value);
    // final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    // FormFieldError? timeAndDateError;
    // if (isEmpty) {
    //   timeAndDateError = FormFieldError.empty;
    // } else if (!isValid) {
    //   timeAndDateError = FormFieldError.invalid;
    // }

    // final currentState = state.copyWith(timeAndDateError: timeAndDateError);

    // emit(currentState);
  }

  void onChangeLocation(
    String value,
  ) {
    _locationSink.add(value);
    // final bool isEmpty = isFieldEmpty(value);
    // final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    // FormFieldError? locationError;
    // if (isEmpty) {
    //   locationError = FormFieldError.empty;
    // } else if (!isValid) {
    //   locationError = FormFieldError.invalid;
    // }

    // final currentState = state.copyWith(locationError: locationError);

    // emit(currentState);
  }

  Future<void> onSubmit({
    required String name,
    required String organizer,
    required String location,
    required String timeAndDate,
  }) async {
// TODO bold assumption here that we dont need data
// and that all data is valid in streams
// TODO question is
// TOOO have to use stream, because we have transformer on the stream, not on the ubject

// ok, if last elemnt completed with error, it stops processing - but how do we inform ui that there was an error?

    final FormFieldError? nameError = _validateName(name);
    final FormFieldError? organizerError = _validateName(organizer);
    final FormFieldError? locationError = _validateName(location);
    final FormFieldError? timeAndDateError = _validateName(timeAndDate);

    final bool isValid = nameError == null &&
        organizerError == null &&
        locationError == null &&
        timeAndDateError == null;

    if (!isValid) {
      if (nameError != null) _nameSink.addError(nameError);
      if (organizerError != null) _organizerSink.addError(organizerError);
      if (locationError != null) _locationSink.addError(locationError);
      if (timeAndDateError != null) _timeAndDateSink.addError(timeAndDateError);

      return;
    }

    final NewMatchValue newMatch = NewMatchValue(
      name: name,
      organizer: organizer,
      timeAndDate: DateTime.now().millisecondsSinceEpoch,
      location: location,
    );

    emit(MatchCreateCubitStateLoading());

    try {
      final String matchId = await matchesUseCases.createMatch(newMatch);
      // final String name = await nameStream.last;
      // final String organizer = await organizerStream.last;
      // final String location = await locationStream.last;
      // final String timeAndDate = await timeAndDateStream.last;

      // TODO test

      emit(MatchCreateCubitStateSuccess(matchId));
    } catch (e) {
      // TODO so in catch, we should somhow reemit - or resend events,so ui knows what is what

      emit(MatchCreateCubitStateFailure('Error crteating match'));
    }
  }

//   Future<void> onSubmit(
//       // TODO this might not be good to come as nwe match value - because we could have different data types in there
//       // NewMatchValue newMatch,
//       {
//     required String name,
//     required String organizer,
//     required String timeAndDate,
//     required String location,
//   }) async {
//     // TODO ALL needs to be validated now
//     // TODO extract this into a function of some sort - maybe even some validator outside of this
//     // TODO we have repeating here
//     // TODO we could have validator to validate all fields in that mixin
//     final bool isNameEmpty = isFieldEmpty(name);
//     final bool isNameValid =
//         isFieldValid(name, _validateRegularFieldForTesting);
//     FormFieldError? nameError;
//     if (isNameEmpty) {
//       nameError = FormFieldError.empty;
//     } else if (!isNameValid) {
//       nameError = FormFieldError.invalid;
//     }

//     final bool isOrganizerEmpty = isFieldEmpty(organizer);
//     final bool isOrganizerValid =
//         isFieldValid(organizer, _validateRegularFieldForTesting);
//     FormFieldError? organizerError;
//     if (isOrganizerEmpty) {
//       organizerError = FormFieldError.empty;
//     } else if (!isOrganizerValid) {
//       organizerError = FormFieldError.invalid;
//     }

// // TODO will need some better validator here - like, if time and date is provided, and if it is in some reasonable period
//     // final bool isTimeAndDateEmpty = isFieldEmpty(timeAndDate);
//     // final bool isTimeAndDateValid = isFieldEmpty(timeAndDate);
//     // FormFieldError? timeAndDateError;
//     // if (isTimeAndDateEmpty) {
//     //   timeAndDateError = FormFieldError.empty;
//     // } else if (!isTimeAndDateValid) {
//     //   timeAndDateError = FormFieldError.invalid;
//     // }

//     final bool isLocationEmpty = isFieldEmpty(location);
//     final bool isLocationValid =
//         isFieldValid(location, _validateRegularFieldForTesting);
//     FormFieldError? locationError;
//     if (isLocationEmpty) {
//       locationError = FormFieldError.empty;
//     } else if (!isLocationValid) {
//       locationError = FormFieldError.invalid;
//     }

//     // TODO this needs more checks actually - this might be clumsy?
//     // TODO figure this out
//     // final int matchTimeAndDate = DateTime.parse(timeAndDate).millisecondsSinceEpoch;
//     // TODO temp
//     final int matchTimeAndDate = DateTime.now().millisecondsSinceEpoch;

//     final bool isFormValid =
//         locationError == null && organizerError == null && nameError == null;

//     if (!isFormValid) {
//       final MatchCreateCubitState errorsState = state.copyWith(
//         locationError: locationError,
//         nameError: nameError,
//         organizerError: organizerError,
//         // TODO dont forget time and date
//       );

//       emit(errorsState);

//       return;
//     }

//     // TODO questionable which layer should build the arguments

//     final NewMatchValue newMatch = NewMatchValue(
//       name: name,
//       organizer: organizer,
//       timeAndDate: matchTimeAndDate,
//       location: location,
//     );

//     final MatchCreateCubitState loadingState = state.copyWith(isLoading: true);
//     emit(loadingState);

//     try {
//       await matchesUseCases.createMatch(newMatch);

// // TODO note the issue with having one state here - we have to cancel loading manually
//       final MatchCreateCubitState successState =
//           state.copyWith(isLoading: false, isSuccess: true);

//       emit(successState);
//     } catch (e) {
//       // TODO again, have to manually cancel laoding - and dont have option to provide error data - unless we have a message there
//       // TODO if we keep it like this, we should probably add some error message thing - to
//       final MatchCreateCubitState failureState = state.copyWith(
//         isLoading: false,
//         isFailure: true,
//       );

//       emit(failureState);

//       // TODO we could use that initial state - but then we lose errors too
//     }
//   }

  // TODO this is for testing only - these functions should live somewhere in some class for validation methods - some helpers or something
  // TODO need some state for holding all items that are invalid

  // transformers
  late final StreamTransformer<String, String> _nameValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      final FormFieldError? nameError = _validateName(value);

      if (nameError != null) {
        sink.addError(nameError);
        return;
      }

      sink.add(value);
    },
  );

  late final StreamTransformer<String, String> _organizerValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      final FormFieldError? organizerError = _validateName(value);

      if (organizerError != null) {
        sink.addError(organizerError);
        return;
      }

      sink.add(value);
    },
  );

  late final StreamTransformer<String, String>
      _timeAndDateValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      final FormFieldError? timeAndDateError = _validateName(value);

      if (timeAndDateError != null) {
        sink.addError(timeAndDateError);
        return;
      }

      sink.add(value);
    },
  );

  late final StreamTransformer<String, String> _locationValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      final FormFieldError? locationError = _validateName(value);

      if (locationError != null) {
        sink.addError(locationError);
        return;
      }

      sink.add(value);
    },
  );

  FormFieldError? _validateName(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    FormFieldError? error;
    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  FormFieldError? _validateLocation(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    FormFieldError? error;
    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  FormFieldError? _validateOrganizer(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    FormFieldError? error;
    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  FormFieldError? _validateTimeAndDate(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid(value, _validateRegularFieldForTesting);

    FormFieldError? error;
    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }
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
