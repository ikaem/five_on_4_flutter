part of 'bloc.dart';

@freezed
class PlayersGetBlocState with _$PlayersGetBlocState {
  factory PlayersGetBlocState.initial() = PlayerGetBlocStateInitial;
  factory PlayersGetBlocState.loading() = PlayerGetBlocStateLoading;
  factory PlayersGetBlocState.failure() = PlayerGetBlocStateFailure;
  factory PlayersGetBlocState.success(List<PlayerModel> players) =
      PlayerGetBlocStateSuccess;
}
