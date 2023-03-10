import 'dart:async';
import 'dart:developer';

import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/utils/mixins/validation_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'cubit.freezed.dart';
part 'cubit_state.dart';

// TODO move all validation logic to use case
class RegisterCubit extends Cubit<RegisterCubitState> with ValidationMixin {
  RegisterCubit({
    required this.authUseCases,
  }) : super(RegisterCubitStateInitial());

  final AuthUseCases authUseCases;

  final BehaviorSubject<String> _emailSubject = BehaviorSubject();
  final BehaviorSubject<String> _passwordSubject = BehaviorSubject();
  final BehaviorSubject<String> _nicknameSubject = BehaviorSubject();

  StreamSink<String> get _emailSink => _emailSubject.sink;
  StreamSink<String> get _passwordSink => _passwordSubject.sink;
  StreamSink<String> get _nicknameSink => _nicknameSubject.sink;

  Stream<String> get emailStream =>
      _emailSubject.stream.transform(_emailValidationTransformer);
  Stream<String> get passwordStream =>
      _passwordSubject.stream.transform(_passwordValidationTransformer);
  Stream<String> get nicknameStream =>
      _nicknameSubject.stream.transform(_nicknameValidationTransformer);

  Stream<bool> get inputsValidationStream => Rx.combineLatest3(
        emailStream,
        passwordStream,
        nicknameStream,
        (a, b, c) => true,
      );

  void onEmailChange(String value) {
    _emailSink.add(value);
  }

  void onPasswordChange(String value) {
    _passwordSink.add(value);
  }

  void onNicknameChange(String value) {
    _nicknameSink.add(value);
  }

  Future<void> onSubmit() async {
    final bool isValid = await authUseCases.handleAuthInputsValidation(
      emailSubject: _emailSubject,
      passwordSubject: _passwordSubject,
      nicknameSubject: _nicknameSubject,
    );

    if (!isValid) return;

    final String email = await _emailSubject.first;
    final String password = await _passwordSubject.first;
    final String nickname = await _nicknameSubject.first;

    final RegisterCredentialsArgs credentials = RegisterCredentialsArgs(
      email: email,
      password: password,
      nickname: nickname,
    );

    emit(RegisterCubitStateLoading());

    try {
      await authUseCases.register(credentials);
      emit(RegisterCubitStateSuccess());
    } catch (e) {
      // TODO we do or should have auth exceptions for better UI feedback
      log('Error -> ${e.toString()}');
      emit(RegisterCubitStateFailure('There was an error registering you'));
    }

    // TODO test
  }

  late final StreamTransformer<String, String> _emailValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = authUseCases.validateEmail(data);

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
      final FormFieldError? error = authUseCases.validatePassword(data);

      if (error != null) {
        sink.addError(error);
        return;
      }

      sink.add(data);
    },
  );

  late final StreamTransformer<String, String> _nicknameValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = authUseCases.validateNickname(data);

      if (error != null) {
        sink.addError(error);
        return;
      }

      sink.add(data);
    },
  );
}
