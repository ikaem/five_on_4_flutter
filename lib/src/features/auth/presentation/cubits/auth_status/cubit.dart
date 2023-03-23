import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

class AuthStatusCubit extends Cubit<AuthStatusCubitState> {
  AuthStatusCubit({
    required AuthUseCases authUseCases,
  })  : _authUseCases = authUseCases,
        super(AuthStatusCubitState.initial());

  final AuthUseCases _authUseCases;

  Future<void> checkAuthStatus() async {
    try {
      // Your Firebase Authentication code here
      emit(AuthStatusCubitState.success());
    } catch (e) {
      emit(
          AuthStatusCubitState.failure('Error checking authentication status'));
    }
  }
}
