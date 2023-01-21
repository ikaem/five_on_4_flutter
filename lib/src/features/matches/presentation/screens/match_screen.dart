import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({
    super.key,
    required this.matchId,
  });

  final String matchId;

  @override
  Widget build(BuildContext context) {
    return _MatchView(
      matchId: matchId,
    );
  }
}

class _MatchView extends StatelessWidget {
  const _MatchView({
    super.key,
    required this.matchId,
  });

// TODO eventually, this will be a full match
  final String matchId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match screen'),
      ),
      body: Center(child: Text('Match Screeen - this is match no. $matchId')),
    );
  }
}
