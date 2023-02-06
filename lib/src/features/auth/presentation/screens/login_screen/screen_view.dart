import 'dart:developer';

import 'package:five_on_4_flutter/src/features/auth/presentation/cubits/cubits.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:five_on_4_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitState>(
      listener: _loginCubitListener,
      builder: _loginCubitBuilder,
    );
  }

  void _loginCubitListener(
    BuildContext context,
    LoginCubitState state,
  ) {
    state.when(
      initial: () => null,
      loading: () => null,
      failure: (message) =>
          context.showSnackBarMessage(message, SnackBarVariant.error),
      success: () {
        // TODO LATER, CALL context.goreplacement, or pushreplacement, or something
        log('Logged in successfully');
      },
    );
  }

  Widget _loginCubitBuilder(
    BuildContext context,
    LoginCubitState state,
  ) {
    final LoginCubit loginCubit = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      // TODO make this thing a separate widget, and make it stateful
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: loginCubit.emailStream,
            builder: _emailInputStreamBuilder,
          ),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          StreamBuilder(
            stream: loginCubit.passwordStream,
            builder: _passwordInputStreamBuilder,
          ),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          StreamBuilder(
            stream: loginCubit.inputsValidationStream,
            builder: _submitButtonStreamBuilder,
          ),
        ],
      ),
    );
  }

  Widget _emailInputStreamBuilder(
      BuildContext context, AsyncSnapshot<String> emailData) {
    final bool isError = emailData.hasError;

    return TextField(
      onChanged: context.read<LoginCubit>().onEmailChange,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: '@',
        labelText: 'Email',
        labelStyle: TextStyle(
          color: isError ? Colors.red : Colors.green,
        ),
      ),
    );
  }

  Widget _passwordInputStreamBuilder(
      BuildContext context, AsyncSnapshot<String> passwordData) {
    final bool isError = passwordData.hasError;

    return TextField(
      obscureText: true,
      onChanged: context.read<LoginCubit>().onPasswordChange,
      decoration: InputDecoration(
        hintText: '*',
        labelText: 'Password',
        labelStyle: TextStyle(
          color: isError ? Colors.red : Colors.green,
        ),
      ),
    );
  }

  Widget _submitButtonStreamBuilder(
      BuildContext context, AsyncSnapshot<bool> inputsValidationData) {
    final bool isValid = inputsValidationData.data == true;

    log('IS VALID: $isValid');

    return ElevatedButton(
      onPressed: isValid ? context.read<LoginCubit>().onSubmit : null,
      child: Text('Submit'),
    );
  }
}
