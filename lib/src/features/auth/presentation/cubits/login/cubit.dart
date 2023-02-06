import 'dart:async';

import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/utils/mixins/validation_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'cubit.freezed.dart';
part 'cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> with ValidationMixin {
  LoginCubit({
    required this.authUseCases,
  }) : super(LoginCubitStateInitial());

  final AuthUseCases authUseCases;

  final BehaviorSubject<String> _emailSubject = BehaviorSubject();
  final BehaviorSubject<String> _passwordSubject = BehaviorSubject();

  StreamSink<String> get _emailSink => _emailSubject.sink;
  StreamSink<String> get _passwordSink => _passwordSubject.sink;

  Stream<String> get emailStream =>
      _emailSubject.stream.transform(_emailValidationTransformer);
  Stream<String> get passwordStream =>
      _passwordSubject.stream.transform(_passwordValidationTransformer);
  Stream<bool> get inputsValidationStream => Rx.combineLatest2(
        emailStream,
        passwordStream,
        (a, b) => true,
      );

  void onEmailChange(String value) {
    _emailSink.add(value);
  }

  void onPasswordChange(String value) {
    _passwordSink.add(value);
  }

  Future<void> onSubmit() async {
    // TODO lets see if we can get values from the stream
    // TODO these could potentrually create errors
    final String email = await _emailSubject.first;
    final String password = await _passwordSubject.first;

    final FormFieldError? emailError = _validateEmail(email);
    final FormFieldError? passwordError = _validatePassword(password);

    final bool isValid = emailError == null && passwordError == null;

    if (!isValid) {
      if (emailError != null) _emailSink.addError(emailError);
      if (passwordError != null) _passwordSink.addError(passwordError);

      return;
    }

    final AuthCredentialsArgs credentials =
        AuthCredentialsArgs(email: email, password: password);

    emit(LoginCubitStateLoading());

    try {
      await authUseCases.login(credentials);
      emit(LoginCubitStateSuccess());
    } catch (e) {
      // TODO we do or should have auth exceptions for better UI feedback
      emit(LoginCubitStateFailure('There was an error logging you in'));
    }

    // TODO test
  }

  late final StreamTransformer<String, String> _emailValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = _validateEmail(data);

      if (error != null) {
        sink.addError(error);
        return;
      }

      sink.add(data);
    },
  );

  late final StreamTransformer<String, String> _passwordValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = _validatePassword(data);

      if (error != null) {
        sink.addError(error);
        return;
      }

      sink.add(data);
    },
  );

  FormFieldError? _validateEmail(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldEmail(value);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  FormFieldError? _validatePassword(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValidPassword(value);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }
}
