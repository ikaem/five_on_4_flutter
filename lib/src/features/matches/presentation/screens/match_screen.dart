import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/match_get/cubit.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:five_on_4_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({
    super.key,
    required this.matchId,
  });

  final String matchId;

  @override
  Widget build(BuildContext context) {
    final MatchesUseCases matchesUseCases = context.read<MatchesUseCases>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<MatchGetCubit>(
          create: (context) => MatchGetCubit(matchesUseCases: matchesUseCases)
            ..loadMatch(matchId),
        ),
      ],
      child: BlocConsumer<MatchGetCubit, MatchGetCubitState>(
        listener: _matchGetCubitListener,
        builder: _matchGetCubitBuilder,
      ),
    );
  }

  Widget _matchGetCubitBuilder(
    BuildContext context,
    MatchGetCubitState state,
  ) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      failure: (message) => Center(
        child: Column(
          children: const [
            Text('There was an error fetching the match'),
            Icon(Icons.error_outline_rounded),
          ],
        ),
      ),
      success: (match) => _MatchView(match: match),
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
}

class _MatchView extends StatelessWidget {
  const _MatchView({
    required this.match,
  });

// TODO eventually, this will be a full match
  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match screen'),
      ),
      // TODO eventually, separate these into widgets
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Match name:'),
          Text(match.name),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          const Text('Description:'),
          const Text('Some match description'),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          const Text('Location:'),
          const Text('Some match location'),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          const Text('Date and time:'),
          const Text('Some match date and time'),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          const Text('Orgnaizer:'),
          const Text('Some match organizer'),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          const Text('Players:'),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          const Text('Some match player 1'),
          const Text('Some match player 2'),
          const Text('Some match player 3'),
          const Text('Some match player 4'),
          const Text('Some match player 5'),
        ],
      ),
    );
  }
}
