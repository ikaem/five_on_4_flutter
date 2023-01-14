import 'package:five_on_4_flutter/src/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO try this without stateful maybe?
class AppRoutingScaffold extends StatefulWidget {
  const AppRoutingScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppRoutingScaffold> createState() => _AppRoutingScaffoldState();
}

class _AppRoutingScaffoldState extends State<AppRoutingScaffold> {
  int get _currentIndex => _generateBarIndexFromLocation(context);

  @override
  Widget build(BuildContext context) {
    final int currentIndex = _currentIndex;

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: _bottomNavigationBarItems,
        onTap: _onBarItemTap(context),
      ),
    );
  }

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: AppRoutes.home.name,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.sports_soccer),
      label: AppRoutes.matches.name,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.directions_run),
      label: AppRoutes.players.name,
    ),
  ];

  void Function(int index) _onBarItemTap(BuildContext context) => (int index) {
        // TODO this could be a bit more elegant - to have a list of raw woutes somewhere
        // if()

        if (index == 0) context.goNamed(AppRoutes.home.name);
        if (index == 1) context.goNamed(AppRoutes.matches.name);
        if (index == 2) context.goNamed(AppRoutes.players.name);
      };

  int _generateBarIndexFromLocation(BuildContext context) {
    // final GoRouter router = GoRouter.of(context);
    // final String location = router.location;

    // TODO could htis work too
    final location = appRouter.location;

    final homePath = AppRoutes.home.path;
    final matchesPath = AppRoutes.matches.path;
    final playersPath = AppRoutes.players.path;

    if (location == homePath) return 0;
    if (location == matchesPath) return 1;
    if (location == playersPath) return 2;

// TODO not susing starts with becuase everyting stars with /
    // if (location.startsWith(homePath)) return 0;
    // if (location.startsWith(matchesPath)) return 1;
    // if (location.startsWith(playersPath)) return 2;

    return 0;
  }
}
