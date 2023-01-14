import 'package:five_on_4_flutter/src/presentation/widgets/widgets.dart'
    show MyMatchesOverview, TodayOverview;
import 'package:five_on_4_flutter/src/theme/theme.dart' show SpacingConstants;
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Column(
        children: const <Widget>[
          // TODO - this porbably needs some match and weather passed in
          // TODO - maybe pass it in in form of some today data class model thing
          TodayOverview(),
          SizedBox(
            height: SpacingConstants.small,
          ),
          MyMatchesOverview(),
        ],
      ),
    );
  }
}
