import 'dart:developer';

import 'package:five_on_4_flutter/src/features/auth/presentation/cubits/register/cubit.dart';
import 'package:five_on_4_flutter/src/navigation/app_routes.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:five_on_4_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
      listener: _registerCubitListener,
      builder: _registerCubitBuilder,
    );
  }

  void _registerCubitListener(
    BuildContext context,
    RegisterCubitState state,
  ) {
    state.when(
      initial: () => null,
      loading: () => null,
      failure: (message) =>
          context.showSnackBarMessage(message, SnackBarVariant.error),
      success: () {
        // TODO LATER, CALL context.goreplacement, or pushreplacement, or something
        log('Registered successfully');
        context.go(AppRoutes.homePath);
      },
    );
  }

  Widget _registerCubitBuilder(
    BuildContext context,
    RegisterCubitState state,
  ) {
    final RegisterCubit registerCubit = context.read<RegisterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      // TODO make this thing a separate widget, and make it stateful
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: registerCubit.emailStream,
            builder: _emailInputStreamBuilder,
          ),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          StreamBuilder(
            stream: registerCubit.passwordStream,
            builder: _passwordInputStreamBuilder,
          ),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          StreamBuilder(
            stream: registerCubit.nicknameStream,
            builder: _nicknameInputStreamBuilder,
          ),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          StreamBuilder(
            stream: registerCubit.inputsValidationStream,
            builder: _submitButtonStreamBuilder,
          ),
          const SizedBox(
            height: SpacingConstants.medium,
          ),
          TextButton(
            onPressed: () {
              context.pushNamed(AppRoutes.login.name);
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _emailInputStreamBuilder(
      BuildContext context, AsyncSnapshot<String> emailData) {
    final bool isError = emailData.hasError;

    return TextField(
      onChanged: context.read<RegisterCubit>().onEmailChange,
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
      onChanged: context.read<RegisterCubit>().onPasswordChange,
      decoration: InputDecoration(
        hintText: '*',
        labelText: 'Password',
        labelStyle: TextStyle(
          color: isError ? Colors.red : Colors.green,
        ),
      ),
    );
  }

  Widget _nicknameInputStreamBuilder(
      BuildContext context, AsyncSnapshot<String> nicknameData) {
    final bool isError = nicknameData.hasError;

    return TextField(
      // obscureText: true,
      onChanged: context.read<RegisterCubit>().onNicknameChange,
      decoration: InputDecoration(
        hintText: 'Choose your nickname',
        labelText: 'Nickname',
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
      onPressed: isValid ? context.read<RegisterCubit>().onSubmit : null,
      child: Text('Submit'),
    );
  }
}
