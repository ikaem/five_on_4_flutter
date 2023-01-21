import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MatchesView();
  }
}

class _MatchesView extends StatelessWidget {
  const _MatchesView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches screen'),
      ),
      body: const Text('Matches Screeen'),
    );
  }
}
