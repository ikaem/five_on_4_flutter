import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MatchView();
  }
}

class _MatchView extends StatelessWidget {
  const _MatchView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match screen"),
      ),
      body: const Text("Match Screeen"),
    );
  }
}
