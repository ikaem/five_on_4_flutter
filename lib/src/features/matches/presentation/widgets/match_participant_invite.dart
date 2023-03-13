import 'package:five_on_4_flutter/src/features/matches/matches.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/match_participants_invite/cubit.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:five_on_4_flutter/src/features/players/domain/use_cases/players_use_cases.dart';
import 'package:five_on_4_flutter/src/features/players/presentation/blocs/players_get/bloc.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchParticipantInvite extends StatelessWidget {
  const MatchParticipantInvite({
    super.key,
    required this.match,
  });

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onParticipantsActionTap(context),
      icon: Icon(Icons.people_outline),
    );
  }

  Future<void> Function() _onParticipantsActionTap(BuildContext context) {
    final PlayersUseCases playersUseCases = context.read<PlayersUseCases>();
    final MatchesUseCases matchesUseCases = context.read<MatchesUseCases>();
    // todo TEST
    return () async {
      // TODo TEST
      await showDialog(
        context: context,
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PlayersGetBloc(
                  playersUseCases: playersUseCases,
                ),
              ),
              BlocProvider(
                create: (context) => MatchParticipantsInviteCubit(
                  matchesUseCases: matchesUseCases,
                ),
              ),
            ],
            child: Builder(builder: (context) {
              final PlayersGetBloc playersGetBloc =
                  context.read<PlayersGetBloc>();

              final MatchParticipantsInviteCubit matchParticipantsInviteCubit =
                  context.read<MatchParticipantsInviteCubit>();

              return Dialog(
                child: Column(
                  children: [
                    Text('Search player to invite to a match'),
                    SizedBox(height: SpacingConstants.medium),
                    TextField(
                      onChanged: (value) {
                        final PlayersGetSearchFilters filters =
                            PlayersGetSearchFilters(searchTerm: value);

                        // onSearchInputChanged(filters);

                        playersGetBloc
                            .add(PlayersGetBlocEventSearchMany(filters));
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    StreamBuilder<List<PlayerModel>>(
                      stream: matchParticipantsInviteCubit
                          .playersForInvitationStream,
                      builder: (context, snapshot) {
                        final List<PlayerModel>? players = snapshot.data;
                        if (players == null || players.isEmpty)
                          return SizedBox.shrink();

                        return Wrap(
                          spacing: 8.0,
                          children: players.map((e) {
                            return Chip(
                              label: Text(e.nickname),
                              deleteIcon: Icon(Icons.delete),
                              onDeleted: () => matchParticipantsInviteCubit
                                  .onRemovePlayer(e),
                            );
                          }).toList(),
                        );

                        // return ListView.separated(
                        //   scrollDirection: Axis.horizontal,
                        //   itemBuilder: (context, index) {
                        //     return null;
                        //   },
                        //   separatorBuilder: separatorBuilder,
                        //   itemCount: itemCount,
                        // );
                      },
                    ),
                    TextButton(
                      onPressed: () => matchParticipantsInviteCubit
                          .onInviteParticipants(match.id),
                      child: Text('Invite'),
                    ),
                    SearchPlayersList(
                        matchParticipantsInviteCubit:
                            matchParticipantsInviteCubit),
                  ],
                ),
              );
            }),
          );
        },
      );
    };
  }

// invite player
  // Future<void> _handleInvitePlayerToMatch({
  //   required BuildContext context,
  //   required String playerId,
  // }) async {

  //   final

  // }
}

class SearchPlayersList extends StatelessWidget {
  const SearchPlayersList({
    super.key,
    required this.matchParticipantsInviteCubit,
  });

// TODO later, remove this from here being acceptet as an argument
  final MatchParticipantsInviteCubit matchParticipantsInviteCubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PlayersGetBloc, PlayersGetBlocState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox.shrink(),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            failure: () => Center(child: Text('Something wrong')),
            success: (players) => ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final PlayerModel player = players[index];
                return ListTile(
                  onTap: () => matchParticipantsInviteCubit.onAddPlayer(player),
                  title: Text(player.nickname),
                );
              },
            ),
          );

          // return ListView();
        },
      ),
    );
  }
}
