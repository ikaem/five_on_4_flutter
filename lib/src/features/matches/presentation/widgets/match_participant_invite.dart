import 'package:five_on_4_flutter/src/features/matches/matches.dart';
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
    // todo TEST
    return () async {
      // TODo TEST
      await showDialog(
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => PlayersGetBloc(
              playersUseCases: playersUseCases,
            ),
            child: Builder(builder: (context) {
              late final PlayersGetBloc _playersGetBloc =
                  context.read<PlayersGetBloc>();

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

                        _playersGetBloc
                            .add(PlayersGetBlocEventSearchMany(filters));
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<PlayersGetBloc, PlayersGetBlocState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => SizedBox.shrink(),
                            loading: () => Center(
                              child: CircularProgressIndicator(),
                            ),
                            failure: () =>
                                Center(child: Text('Something wrong')),
                            success: (players) => ListView.builder(
                              itemCount: players.length,
                              itemBuilder: (context, index) {
                                final PlayerModel player = players[index];
                                return ListTile(
                                  title: Text(player.nickname),
                                );
                              },
                            ),
                          );

                          // return ListView();
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      );
    };
  }
}
