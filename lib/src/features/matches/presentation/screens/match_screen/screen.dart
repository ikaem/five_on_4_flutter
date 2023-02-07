import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/match_get/cubit.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/screens/match_screen/screen_view.dart';
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
          // TODO
        ),
      ],
      child: MatchScreenView(),
    );
  }
}
