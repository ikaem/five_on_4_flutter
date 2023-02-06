import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/auth.dart';
import 'package:five_on_4_flutter/src/features/auth/presentation/providers/providers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

class AuthStatusCubit extends Cubit<AuthStatusCubitState> {
  AuthStatusCubit({
    required this.authUseCases,
  }) : super(AuthStatusCubitStateInitial()) {
    _onInitializeCubit();
  }

  final AuthUseCases authUseCases;

  final AuthStatusProvider _authStatusProvider = AuthStatusProvider();
  AuthStatusProvider get authStatusProvider => _authStatusProvider;

  Future<void> _onInitializeCubit() async {
    authUseCases.handleAuthSubscription(
      onAuthEvent: _onAuthEvent,
      onAuthEventException: _onAuthEventException,
    );

    await authUseCases.checkAuth();
  }

  void _onAuthEvent(AuthModel? auth) {
    _authStatusProvider.setAuth(auth);
  }

  void _onAuthEventException(Object exception) {
    emit(
      AuthStatusCubitStateFailure(
        'There was an error authenticating your session',
      ),
    );
  }

  @override
  Future<void> close() async {
    authUseCases.cancelAuthSubscription();
    await super.close();
  }
}
