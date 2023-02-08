// TODO - later, create functions to create rotues later

import 'package:five_on_4_flutter/src/features/auth/presentation/presentation.dart';
import 'package:five_on_4_flutter/src/features/auth/presentation/screens/register_screen/login_screen.dart';
import 'package:five_on_4_flutter/src/features/matches/matches.dart'
    show MatchCreateScreen, MatchScreen, MatchesScreen;
import 'package:five_on_4_flutter/src/features/players/players.dart'
    show PlayersScreen;
import 'package:five_on_4_flutter/src/navigation/app_routing_scaffold.dart';
import 'package:five_on_4_flutter/src/navigation/navigation.dart'
    show AppRoutes;
import 'package:five_on_4_flutter/src/presentation/presentation.dart'
    show HomeScreen;
import 'package:go_router/go_router.dart';

// as per https://snehmehta.medium.com/dynamic-bottom-navigation-with-go-router-flutter-power-series-part-1-2437e2d72546
// https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter-beamer/
// https://www.kodeco.com/28987851-flutter-navigator-2-0-using-go_router

// TODO this should definitely nbe a class - and then provide it throughtout the app

// TODO test
class AppRouter {
  AppRouter({
    required this.authStatusProvider,
  });

  final AuthStatusProvider authStatusProvider;

  late final GoRouter router = GoRouter(
    // navigatorKey: rootNavigatorKey,
    // TODO not sure if this is needed at a ll
    initialLocation: AppRoutes.home.path,
    routes: [
      _shellRoute,
      _loginRoute,
      _registerRoute,
      _matchRoute,
      _matchCreateRoute,
    ],
    refreshListenable: authStatusProvider,
    redirect: (context, state) {
      // TODO test
      if (!authStatusProvider.isLoggedIn) {
        switch (state.location) {
          case AppRoutes.registerPath:
            return AppRoutes.registerPath;
          default:
            return AppRoutes.loginPath;
        }
      }

      if (state.location == AppRoutes.loginPath) {
        return AppRoutes.homePath;
      }

      return state.location;
    },
  );

  late final ShellRoute _shellRoute = ShellRoute(
    // navigatorKey: shellNavigatorKey,
    // TODO this child is what will be returned from each go route
    builder: (context, state, child) => AppRoutingScaffold(child: child),
    routes: [
      _homeRoute,
      _playersRoute,
      _matchesRoute,
    ],
  );

// TODO make functions form these - and export them from libraries
  final GoRoute _homeRoute = GoRoute(
    path: AppRoutes.home.path,
    name: AppRoutes.home.name,
    // TODO check if page builder will make .go naivgation actuvate back otpion on screen
    builder: (context, state) => const HomeScreen(),
  );

  final GoRoute _loginRoute = GoRoute(
    path: AppRoutes.login.path,
    name: AppRoutes.login.name,
    // TODO check if page builder will make .go naivgation actuvate back otpion on screen
    builder: (context, state) => const LoginScreen(),
  );

  final GoRoute _registerRoute = GoRoute(
    path: AppRoutes.register.path,
    name: AppRoutes.register.name,
    // TODO check if page builder will make .go naivgation actuvate back otpion on screen
    builder: (context, state) => const RegisterScreen(),
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

  final GoRoute _matchRoute = GoRoute(
    path: AppRoutes.match().path,
    name: AppRoutes.match().name,
    builder: (context, state) {
      final String matchId = state.params['id']!;

      return MatchScreen(
        matchId: matchId,
      );
    },
  );

  final GoRoute _matchCreateRoute = GoRoute(
    path: AppRoutes.matchCreate.path,
    name: AppRoutes.matchCreate.name,
    builder: (context, state) {
      return const MatchCreateScreen();
    },
  );
}
