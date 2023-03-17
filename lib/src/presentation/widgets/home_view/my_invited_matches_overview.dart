import 'package:five_on_4_flutter/src/features/matches/matches.dart';
import 'package:flutter/material.dart';

class MyInvitedMatchesOverview extends StatelessWidget {
  const MyInvitedMatchesOverview({
    super.key,
    required this.matches,
    required this.onMatchBriefCardTap,
  });

  final List<MatchModel> matches;
  final OnMatchBriefCardTap onMatchBriefCardTap;

// TODO this could easily be merged with my joined matches
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Pending invitations'),
        ...matches.map(
          (m) => MatchBriefCard(
            match: m,
            onMatchBriefCardTap: onMatchBriefCardTap,
          ),
        ),
        // MatchBriefCard(
        //   match: MatchModel(
        //     id: '1',
        //     name: 'Test',
        //     joinedParticipants: [],
        //     invitedParticipants: [],
        //   ),
        //   onMatchBriefCardTap: ({
        //     required BuildContext context,
        //     required String matchId,
        //   }) {},
        // ),
        // MatchBriefCard(
        //   match: MatchModel(
        //     id: '1',
        //     name: 'Test',
        //     joinedParticipants: [],
        //     invitedParticipants: [],
        //   ),
        //   onMatchBriefCardTap: ({
        //     required BuildContext context,
        //     required String matchId,
        //   }) {},
        // ),
        // MatchBriefCard(
        //   match: MatchModel(
        //     id: '1',
        //     name: 'Test',
        //     joinedParticipants: [],
        //     invitedParticipants: [],
        //   ),
        //   onMatchBriefCardTap: ({
        //     required BuildContext context,
        //     required String matchId,
        //   }) {},
        // ),
      ],
    );
  }
}
