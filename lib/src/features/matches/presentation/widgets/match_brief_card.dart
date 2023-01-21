import 'package:five_on_4_flutter/src/features/matches/matches.dart'
    show MatchModel;
import 'package:flutter/material.dart';

// TODO defining typedefs in widgert that uses that  - or in the file that uses them originally

typedef OnMatchBriefCardTap = void Function({
  required String matchId,
  required BuildContext context,
});

class MatchBriefCard extends StatelessWidget {
  const MatchBriefCard({
    super.key,
    required this.match,
    required this.onMatchBriefCardTap,
  });

  final MatchModel match;
  final OnMatchBriefCardTap onMatchBriefCardTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onMatchBriefCardTap(
          matchId: match.id,
          context: context,
        ),
        title: Text(match.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Some location'),
            Text('Some time'),
          ],
        ),
      ),
    );
  }
}
