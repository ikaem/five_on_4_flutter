import 'dart:async';

import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/data/data.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/auth.dart';
import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';
import 'package:five_on_4_flutter/src/utils/mixins/validation_mixin.dart';
import 'package:rxdart/rxdart.dart';

typedef OnAuthEvent = void Function(AuthModel? event);
typedef OnAuthEventException = void Function(Object e);

class AuthUseCases with ValidationMixin {
  AuthUseCases({
    required this.authRepository,
    // required this.playersRepository,
  });

  final AuthRepository authRepository;
  // final PlayersRepository playersRepository;

// TODO probably should not initialize it like this
  late final StreamSubscription<AuthModel?> _authSubscription =
      authRepository.observeAuth.listen((auth) => auth);

  Future<void> login(LoginCredentialsArgs credentialsArgs) async {
    try {
      // TODO dont need auth id
      final String authId = await authRepository.login(credentialsArgs);

      // await playersRepository.loadPlayerbyAuthId(authId);
    } catch (e) {
      await authRepository.logout();
      // await playersRepository.clearCurrentPlayer();

      rethrow;
    }
  }

  Future<void> logout() async {
    await authRepository.logout();
  }

// this is not used anywhere actually now
//   Future<void> checkAuth() async {
//     try {
//       final String? authId = await authRepository.checkAuth();
//       if (authId == null)
//         throw HttpUnathorizedException(message: 'No such user');

// // this is done by the initial data thing
//       // await playersRepository.loadPlayerbyAuthId(authId);
//     } catch (e) {
//       await authRepository.logout();
//       // await playersRepository.clearCurrentPlayer();

//       rethrow;
//     }
//   }

  Future<void> register(RegisterCredentialsArgs credentialsArgs) async {
    final String authId = await authRepository.register(credentialsArgs);

    final PlayerArgs newPlayerArgs = PlayerArgs(
      authId: authId,
      nickname: credentialsArgs.nickname,
      email: credentialsArgs.email,
    );

    // await playersRepository.createPlayer(newPlayerArgs);
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
    required BehaviorSubject<String> nicknameSubject,
  }) async {
    final String email = await emailSubject.first;
    final String password = await passwordSubject.first;
    final String nickname = await nicknameSubject.first;

    final FormFieldError? emailError = validateEmail(email);
    final FormFieldError? passwordError = validatePassword(password);
    final FormFieldError? nicknameError = validateNickname(nickname);

    final bool isValid =
        emailError == null && passwordError == null && nicknameError == null;

    if (isValid) return true;

    if (emailError != null) emailSubject.sink.addError(emailError);
    if (passwordError != null) passwordSubject.sink.addError(passwordError);
    if (nicknameError != null) nicknameSubject.sink.addError(nicknameError);

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

  FormFieldError? validateNickname(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid(value, (value) => value.length > 6);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    }

    // else if (!isValid) {
    //   error = FormFieldError.invalid;
    // }

    return error;
  }
}
