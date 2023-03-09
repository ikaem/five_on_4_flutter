import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/extensions/extensions.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/match_get/cubit.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/match_join/cubit.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/widgets/match_content.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/widgets/match_participant_invite.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:five_on_4_flutter/src/features/players/presentation/blocs/players_get/bloc.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/layout/app_bar_more_actions.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:five_on_4_flutter/src/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchScreenView extends StatefulWidget {
  const MatchScreenView({
    super.key,
  });

  @override
  State<MatchScreenView> createState() => _MatchScreenViewState();
}

class _MatchScreenViewState extends State<MatchScreenView> {
  late final MatchJoinCubit _matchJoinCubit = context.read<MatchJoinCubit>();
  late final MatchGetCubit _matchGetCubit = context.read<MatchGetCubit>();
  // late final AuthStatusCubit _authStatusCubit = context.read<AuthStatusCubit>();

  // late final PlayersGetBloc _playersGetBloc = context.read<PlayersGetBloc>();

  @override
  void initState() {
    super.initState();
    _initializeView();
  }

  @override
  void dispose() {
    _disposeView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // log('${_authStatusCubit.auth?.email}');

    return BlocConsumer<MatchGetCubit, MatchGetCubitState>(
      listener: _matchGetCubitListener,
      builder: _matchGetCubitBuilder,
    );
  }

  void _matchGetCubitListener(
    BuildContext context,
    MatchGetCubitState state,
  ) {
    state.when(
      initial: () => null,
      loading: () => null,
      success: (match) => null,
      failure: (message) => context.showSnackBarMessage(
        message,
        SnackBarVariant.error,
      ),
    );
  }

  Widget _matchGetCubitBuilder(
    BuildContext context,
    MatchGetCubitState state,
  ) {
    final Size size = MediaQuery.of(context).size;
    final PlayerModel? currentPlayer = context.currentPlayer;

    return state.when(
      initial: () => ColoredBox(
        color: Colors.white,
      ),
      loading: () => Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Center(child: CircularProgressIndicator()),
      ),
      failure: (message) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(message)),
      ),
      success: (match) => _matchGetCubitSuccessBuilder(match, currentPlayer),
    );
  }

  Scaffold _matchGetCubitSuccessBuilder(
    MatchModel match,
    PlayerModel? currentPlayer,
  ) {
    final bool hasUserJoinedMatch =
        match.checkHasUserJoinedMatch(playerId: currentPlayer?.id);

    final IconData joinIcon =
        !hasUserJoinedMatch ? Icons.person_add : Icons.person_remove;

    return Scaffold(
      appBar: AppBar(
        title: Text('Match details'),
        actions: [
          // TODO note sure if bloc builder should be here
          // it should probably be in app bar match participatns action, to be honest
          // BlocBuilder<PlayersGetBloc, PlayersGetBlocState>(
          //   builder: (context, state) {
          //     final bool isLoading = state is PlayersGetBlocStateLoading;
          //     final List<PlayerModel> foundPlayers =
          //         state is PlayersGetBlocStateSuccess ? state.players : [];

          //     return AppBarMatchParticipantsAction(
          //       onPlayersSearch: (filters) => _playersGetBloc.add(
          //         PlayersGetBlocEventSearchMany(filters),
          //       ),
          //       foundPlayers: foundPlayers,
          //       isLoading: isLoading,
          //     );
          //   },
          // ),
          MatchParticipantInvite(
            match: match,
          ),
          // TODO test
          AppBarMatchJoinAction(
              // matchJoinCubit: _matchJoinCubit,
              onTapParticipateInMatch: () => _matchJoinCubit.participateInMatch(
                    matchId: match.id,
                    shouldJoin: !hasUserJoinedMatch,
                  ),
              hasUserJoinedMatch: hasUserJoinedMatch,
              joinIcon: joinIcon),
          AppBarMoreActions(),
        ],
      ),
      body: MatchContent(
        match: match,
      ),
    );
  }

  void _initializeView() {
    _matchJoinCubit.stream.listen(
      (state) {
        state.when(
          initial: () => null,
          loading: () => null,
          success: (matchId) {
            _matchGetCubit.loadMatch(matchId);
            context.showSnackBarMessage('Match joined successfully');
          },
          failure: (message) =>
              context.showSnackBarMessage(message, SnackBarVariant.error),
        );
      },
    );
  }

  void _disposeView() {
    // bloc is closed automatically with bloc provider from the bloc screen
    // _matchJoinCubit.close();
  }
}

// TODO move tis widget elsewhere, and have the typedef there as well
typedef OnPlayersSearch = void Function(PlayersGetSearchFilters filters);

class AppBarMatchParticipantsAction extends StatelessWidget {
  const AppBarMatchParticipantsAction({
    super.key,
    required this.onPlayersSearch,
    required this.foundPlayers,
    required this.isLoading,
  });

  final OnPlayersSearch onPlayersSearch;
  final List<PlayerModel> foundPlayers;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    // TODO test
    return IconButton(
      onPressed: _onParticipantsActionTap(context),
      icon: Icon(Icons.people_outline),
    );
  }

  Future<void> Function() _onParticipantsActionTap(BuildContext context) {
    final players = foundPlayers;

    // todo TEST
    return () async {
      // TODo TEST
      await showDialog(
        context: context,
        builder: (context) => _participantsDialogBuilder(
          context,
          onPlayersSearch,
          players,
        ),
        // builder: (context) {
        //   return Material(child: TextField());
        // },
      );
    };
  }

  Widget _participantsDialogBuilder(
    BuildContext context,
    Function(PlayersGetSearchFilters) onSearchInputChanged,
    List<PlayerModel> players,
    // TODO i dont get data here - i need to get data here, but this is already rendered when i open it
  ) {
    // TODO test
    return Material(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(SpacingConstants.medium),
        margin: EdgeInsets.all(SpacingConstants.medium),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
          ),
          child: ListView(
            children: [
              Text('Search player to invite to a match'),
              SizedBox(height: SpacingConstants.medium),
              TextField(
                onChanged: (value) {
                  final PlayersGetSearchFilters filters =
                      PlayersGetSearchFilters(searchTerm: value);

                  onSearchInputChanged(filters);

                  // _playersGetBloc.add(PlayersGetBlocEventSearchMany(filters));
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: SpacingConstants.medium),
              TextButton(onPressed: () {}, child: Text('Search')),
              SizedBox(height: SpacingConstants.medium),
              // if (isLoading)
              //   Center(
              //     child: CircularProgressIndicator(),
              //   ),

              // // TODO this needs to be better - maybe a separate widget as a sliver or somehting
              // for (final player in foundPlayers) Text(player.nickname)

              BlocSelector<PlayersGetBloc, PlayersGetBlocState, bool>(
                selector: (state) {
                  return state is PlayersGetBlocStateLoading;
                },
                builder: (context, state) {
                  if (state == false) {
                    return Text('false');
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),

              // BlocSelector<PlayersGetBloc, PlayersGetBlocState,
              //     List<PlayerModel>>(
              //   selector: (state) {
              //     if (state is! PlayersGetBlocStateSuccess) return [];

              //     return state.players;
              //   },
              //   builder: (context, players) {
              //     // TODO test
              //     return ListView(
              //       // TODO move this away
              //       shrinkWrap: true,
              //       children: [for (final player in players) Text('Hello')],
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO move this or dont move it to a widget , both of thse

class AppBarMatchJoinAction extends StatelessWidget {
  const AppBarMatchJoinAction({
    super.key,
    // required MatchJoinCubit matchJoinCubit,
    required this.hasUserJoinedMatch,
    required this.joinIcon,
    required this.onTapParticipateInMatch,
  });
  // _matchJoinCubit = matchJoinCubit;

  // final MatchJoinCubit _matchJoinCubit;
  final bool hasUserJoinedMatch;
  final IconData joinIcon;
  final VoidCallback onTapParticipateInMatch;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MatchJoinCubit, MatchJoinCubitState, bool>(
      selector: (state) {
        return state is MatchJoinCubitStateLoading;
      },
      builder: (context, isLoading) {
        return IconButton(
          onPressed: isLoading
              ? null
              : () async {
                  await onTapParticipateInMatch;
                  // TODO test
                  // await onTapParticipateInMatch(
                  //   matchId: match.id,
                  //   shouldJoin: !hasUserJoinedMatch,
                  // );
                },
          icon: Icon(joinIcon),
        );
      },
    );
  }
}
