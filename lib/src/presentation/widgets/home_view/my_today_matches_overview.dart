import 'package:collection/collection.dart';
import 'package:five_on_4_flutter/src/features/matches/matches.dart'
    show MatchBriefCard, MatchModel, OnMatchBriefCardTap;
import 'package:flutter/material.dart';

class MyTodayMatchesOverview extends StatelessWidget {
  const MyTodayMatchesOverview({
    super.key,
    required this.onMatchBriefCardTap,
    required this.matches,
  });

  final OnMatchBriefCardTap onMatchBriefCardTap;
  final List<MatchModel> matches;

  @override
  Widget build(BuildContext context) {
// TODO temp show only one match here
    final MatchModel? match = matches.firstOrNull;

    if (match == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Today'),
        const Text('Next match:'),
        MatchBriefCard(
          match: match,
          onMatchBriefCardTap: onMatchBriefCardTap,
        ),
      ],
    );
  }
}
