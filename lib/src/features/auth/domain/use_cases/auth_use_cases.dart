import 'dart:async';

import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/data/data.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/auth.dart';
import 'package:five_on_4_flutter/src/utils/mixins/validation_mixin.dart';
import 'package:rxdart/rxdart.dart';

typedef OnAuthEvent = void Function(AuthModel? event);
typedef OnAuthEventException = void Function(Object e);

class AuthUseCases with ValidationMixin {
  AuthUseCases({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  late final StreamSubscription<AuthModel?> _authSubscription =
      authRepository.observeAuth.listen((auth) => auth);

  Future<void> login(AuthCredentialsArgs credentialsArgs) async {
    await authRepository.login(credentialsArgs);
  }

  Future<void> logout() async {
    await authRepository.logout();
  }

  Future<void> checkAuth() async {
    await authRepository.checkAuth();
  }

  Future<void> register(AuthCredentialsArgs credentialsArgs) async {
    await authRepository.register(credentialsArgs);
  }

  void handleAuthSubscription({
    required OnAuthEvent onAuthEvent,
    required OnAuthEventException onAuthEventException,
  }) {
    _authSubscription.onData(onAuthEvent);
    _authSubscription.onError(onAuthEventException);
  }

  Future<void> cancelAuthSubscription() => _authSubscription.cancel();

  Future<bool> handleAuthInputsValidation({
    required BehaviorSubject<String> emailSubject,
    required BehaviorSubject<String> passwordSubject,
  }) async {
    final String email = await emailSubject.first;
    final String password = await passwordSubject.first;

    final FormFieldError? emailError = validateEmail(email);
    final FormFieldError? passwordError = validatePassword(password);

    final bool isValid = emailError == null && passwordError == null;

    if (isValid) return true;

    if (emailError != null) emailSubject.sink.addError(emailError);
    if (passwordError != null) passwordSubject.sink.addError(passwordError);

    return false;
  }

  FormFieldError? validateEmail(String value) {
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

  FormFieldError? validatePassword(String value) {
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
