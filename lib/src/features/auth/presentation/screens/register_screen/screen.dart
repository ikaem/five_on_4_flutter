import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/presentation/cubits/register/cubit.dart';
import 'package:five_on_4_flutter/src/features/auth/presentation/screens/register_screen/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthUseCases authUseCases = context.read<AuthUseCases>();

    return BlocProvider(
      create: (context) => RegisterCubit(authUseCases: authUseCases),
      child: RegisterScreenView(),
    );
  }
}
