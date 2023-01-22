import 'package:five_on_4_flutter/src/features/matches/matches.dart'
    show MatchBriefCard, MatchModel, OnMatchBriefCardTap;
import 'package:flutter/material.dart';

class MyMatchesOverview extends StatelessWidget {
  const MyMatchesOverview({
    super.key,
    required this.onMatchBriefCardTap,
    required this.matches,
  });

  final OnMatchBriefCardTap onMatchBriefCardTap;
  final List<MatchModel> matches;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('My matches'),
        ...matches.map(
          (m) => MatchBriefCard(
            match: m,
            onMatchBriefCardTap: onMatchBriefCardTap,
          ),
        ),
      ],
    );
  }
}
