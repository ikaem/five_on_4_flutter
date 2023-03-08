part of 'bloc.dart';

@freezed
class PlayersGetBlocState with _$PlayersGetBlocState {
  factory PlayersGetBlocState.initial() = PlayersGetBlocStateInitial;
  factory PlayersGetBlocState.loading() = PlayersGetBlocStateLoading;
  factory PlayersGetBlocState.failure() = PlayersGetBlocStateFailure;
  factory PlayersGetBlocState.success(List<PlayerModel> players) =
      PlayersGetBlocStateSuccess;
}
