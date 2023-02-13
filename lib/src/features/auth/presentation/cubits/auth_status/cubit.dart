import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/auth.dart';
import 'package:five_on_4_flutter/src/features/auth/presentation/providers/providers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

class AuthStatusCubit extends Cubit<AuthStatusCubitState> {
  AuthStatusCubit({
    required AuthUseCases authUseCases,
    required AuthStatusProvider authStatusProvider,
  })  : _authUseCases = authUseCases,
        _authStatusProvider = authStatusProvider,
        super(AuthStatusCubitStateInitial()) {
    _onInitializeCubit();
  }

  final AuthUseCases _authUseCases;
  final AuthStatusProvider _authStatusProvider;

  // final AuthStatusProvider _authStatusProvider = AuthStatusProvider();

  AuthStatusProvider get authStatus => _authStatusProvider;
  AuthModel? get auth => authStatus.auth;

  Future<void> _onInitializeCubit() async {
    _authUseCases.handleAuthSubscription(
      onAuthEvent: _onAuthEvent,
      onAuthEventException: _onAuthEventException,
    );
    await _authUseCases.checkAuth();
  }

  void _onAuthEvent(AuthModel? auth) {
    authStatus.auth = auth;
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
    _authUseCases.cancelAuthSubscription();
    await super.close();
  }
}
