import 'package:five_on_4_flutter/src/features/matches/matches.dart'
    show MatchBriefCard, MatchModel, OnMatchBriefCardTap;
import 'package:flutter/material.dart';

class MyTodayMatchesOverview extends StatelessWidget {
  const MyTodayMatchesOverview({
    super.key,
    required this.onMatchBriefCardTap,
  });

  final OnMatchBriefCardTap onMatchBriefCardTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Today'),
        const Text('Next match:'),
        MatchBriefCard(
          match: const MatchModel(id: '1', name: 'Some match name'),
          onMatchBriefCardTap: onMatchBriefCardTap,
        ),
      ],
    );
  }
}
