// TODO - later, create functions to create rotues later

import 'package:five_on_4_flutter/src/features/matches/matches.dart'
    show MatchesScreen;
import 'package:five_on_4_flutter/src/features/players/players.dart'
    show PlayersScreen;
import 'package:five_on_4_flutter/src/navigation/navigation.dart'
    show AppRoutes;
import 'package:five_on_4_flutter/src/presentation/presentation.dart'
    show HomeScreen;
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'app_routing_scaffold.dart';

// as per https://snehmehta.medium.com/dynamic-bottom-navigation-with-go-router-flutter-power-series-part-1-2437e2d72546
// https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter-beamer/
// https://www.kodeco.com/28987851-flutter-navigator-2-0-using-go_router

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// TODO this should definitely nbe a class - and then provide it throughtout the app

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // TODO not sure if this is needed at a ll
  initialLocation: AppRoutes.home.path,
  routes: [_shellRoute],
);

final ShellRoute _shellRoute = ShellRoute(
    navigatorKey: _shellNavigatorKey,
    // TODO this child is what will be returned from each go route
    builder: (context, state, child) => AppRoutingScaffold(child: child),
    routes: [
      _homeRoute,
      _playersRoute,
      _matchesRoute,
    ]);

// TODO make functions form these - and export them from libraries
final GoRoute _homeRoute = GoRoute(
  path: AppRoutes.home.path,
  name: AppRoutes.home.name,
  // TODO check if page builder will make .go naivgation actuvate back otpion on screen
  builder: (context, state) => const HomeScreen(),
);

final GoRoute _playersRoute = GoRoute(
  path: AppRoutes.players.path,
  name: AppRoutes.players.name,
  builder: (context, state) => const PlayersScreen(),
);

final GoRoute _matchesRoute = GoRoute(
  path: AppRoutes.matches.path,
  name: AppRoutes.matches.name,
  builder: (context, state) => const MatchesScreen(),
);

// TODO test
class AppRouter {
  AppRouter({
    required this.authState,
  });

  final Listenable authState;

  late final GoRouter appRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    // TODO not sure if this is needed at a ll
    refreshListenable: authState,
    initialLocation: AppRoutes.home.path,
    routes: [_shellRoute],
  );
}
