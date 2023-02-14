import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

// TODO test only
final PlayerModel _tempPlayer = PlayerModel(
  id: '2',
  authId: '1',
  nickname: 'zidane',
  email: 's@s.hr',
);

class PlayerCurrentCubit extends Cubit<PlayerCurrentCubitState> {
// TODO old

//   PlayerCurrentGetCubit({
//     required AuthStatusProvider authStatusProvider,
//     // required PlayersUseCases playersUseCases,
//   })  : _authStatusProvider = authStatusProvider,
//         super(PlayerCurrentGetCubitStateInitial()) {
//     // this could be a function triggered by a call from backend
//     // also, on closing this, we want to clear the data - well, it will be closed anyhow

//     // TODO have to react to logged in data

//     authStatusProvider.addListener(() async {
//       if (authStatusProvider.isLoggedIn) {
//         await _onLoggedIn();
// // this should call some function load current user, start loading and such
//         return;
//       }

//       await _onLoggedOut();
//     });
//   }

//   // final PlayersUseCases _playersUseCases;
//   final AuthStatusProvider _authStatusProvider;
//   PlayerModel? _currentPlayer;

//   PlayerModel? get currentPlayer => _currentPlayer;

//   Future<void> _onLoggedIn() async {
//     log('we are logged in');
//     log('fetching starting...');
//     emit(PlayerCurrentGetCubitStateLoading());
//     await Future.delayed(Duration(milliseconds: 2000));
//     _currentPlayer = _tempPlayer;
//     emit(PlayerCurrentGetCubitStateSuccess());

//     // emit(PlayerCurrentGetCubitStateNotFound());
//     log('fetching ended');
//   }

//   Future<void> _onLoggedOut() async {
//     log('we are logged out');
//     log('removing logged user');
//     _currentPlayer = null;

//     // emit(PlayerCurrentGetCubitStateSuccess());
//     emit(PlayerCurrentGetCubitStateSuccess());
//     log('removed logged user');
//   }
}
