import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/models/match_participant/model.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:flutter/material.dart';

class MatchContent extends StatelessWidget {
  const MatchContent({
    super.key,
    required this.match,
  });

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        // TOOD this should be its own widget
        const Text('Confirmed players:'),
        const SizedBox(
          height: SpacingConstants.small,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: match.joinedParticipants.length,
            itemBuilder: (context, index) {
              final MatchParticipantModel participant =
                  match.joinedParticipants[index];
              final String nickname = participant.nickname;

              return Text(nickname);
            },
          ),
        ),
        const Text('Pending confirmation players:'),
        const SizedBox(
          height: SpacingConstants.small,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: match.invitedParticipants.length,
            itemBuilder: (context, index) {
              final MatchParticipantModel participant =
                  match.invitedParticipants[index];
              final String nickname = participant.nickname;

              return Text(nickname);
            },
          ),
        )
      ],
    );
  }
}
