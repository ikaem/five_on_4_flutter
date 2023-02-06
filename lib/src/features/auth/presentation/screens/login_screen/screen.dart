import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/presentation/cubits/cubits.dart';
import 'package:five_on_4_flutter/src/features/auth/presentation/screens/login_screen/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthUseCases authUseCases = context.read<AuthUseCases>();

    return BlocProvider(
      create: (context) => LoginCubit(authUseCases: authUseCases),
      child: LoginScreenView(),
    );
  }
}
