import 'package:five_on_4_flutter/src/features/matches/matches.dart'
    show MatchBriefCard, MatchModel;
import 'package:five_on_4_flutter/src/theme/theme.dart' show SpacingConstants;
import 'package:flutter/material.dart';

class TodayOverview extends StatelessWidget {
  const TodayOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("Today"),
        const Text("Next match:"),
        MatchBriefCard(
          match: const MatchModel(id: "1", name: "Some match name"),
          onMatchBriefCardTap: () {},
        ),
        const SizedBox(
          height: SpacingConstants.small,
        ),
        Column(
          children: const <Widget>[Icon(Icons.sunny), Text("Sunny")],
        ),
      ],
    );
  }
}
