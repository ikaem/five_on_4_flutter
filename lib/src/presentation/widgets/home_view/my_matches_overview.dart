import 'package:five_on_4_flutter/src/features/matches/matches.dart'
    show MatchBriefCard, MatchModel, OnMatchBriefCardTap;
import 'package:flutter/material.dart';

class MyMatchesOverview extends StatelessWidget {
  const MyMatchesOverview({
    super.key,
    required this.onMatchBriefCardTap,
  });

  final OnMatchBriefCardTap onMatchBriefCardTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('My matches'),
        ..._matches
            .map(
              (m) => MatchBriefCard(
                match: m,
                onMatchBriefCardTap: onMatchBriefCardTap,
              ),
            )
            .toList(),
      ],
    );
  }
}

// TODO this is temp only
final List<MatchModel> _matches = [
  const MatchModel(id: '2', name: 'Some match name 2'),
  const MatchModel(id: '3', name: 'Some match name 3'),
  const MatchModel(id: '4', name: 'Some match name 4'),
  const MatchModel(id: '5', name: 'Some match name 5'),
  const MatchModel(id: '6', name: 'Some match name 6'),
  const MatchModel(id: '7', name: 'Some match name 7'),
];
