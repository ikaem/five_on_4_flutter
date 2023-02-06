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
  }

  void onChangeOrganizer(
    String value,
  ) {
    _organizerSink.add(value);
  }

  void onChangeTimeAndDate(
    String value,
  ) {
    _timeAndDateSink.add(value);
  }

  void onChangeLocation(
    String value,
  ) {
    _locationSink.add(value);
  }

  Future<void> onSubmit({
    required String name,
    required String organizer,
    required String location,
    required String timeAndDate,
  }) async {
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

      emit(MatchCreateCubitStateSuccess(matchId));
    } catch (e) {
      emit(MatchCreateCubitStateFailure('Error crteating match'));
    }
  }

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

bool _validateRegularFieldForTesting(String value) => true;
