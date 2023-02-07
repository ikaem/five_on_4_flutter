import 'package:five_on_4_flutter/src/domain/models/models.dart';

abstract class AppRoutes {
  static const String idPlaceholder = ':id';

  static const homePath = '/';
  static const loginPath = '/login';
  static const registerPath = '/register';
  static const matchesPath = '/matches';
  static const playersPath = '/players';
  static const matchCreatePath = '/match-create';

  static AppRouteModel get home => const AppRouteModel(
        path: '$homePath',
        name: 'Home',
      );

  static AppRouteModel get login => const AppRouteModel(
        path: '$loginPath',
        name: 'Login',
      );

  static AppRouteModel get register => const AppRouteModel(
        path: '$registerPath',
        name: 'Register',
      );

  static AppRouteModel get matches => const AppRouteModel(
        path: '$matchesPath',
        name: 'Matches',
      );

  static AppRouteModel get players => const AppRouteModel(
        path: '$playersPath',
        name: 'Players',
      );

  static AppRouteModel get matchCreate => const AppRouteModel(
        path: '$matchCreatePath',
        name: 'MatchCreate',
      );

  static AppRouteModel match([String? id]) {
    final String matchId = id ?? idPlaceholder;

    return AppRouteModel(
      path: '$matchesPath/$matchId',
      name: 'Match',
    );
  }

  static AppRouteModel player([String? id]) {
    final String player = id ?? idPlaceholder;

    return AppRouteModel(
      path: '$playersPath/$player',
      name: 'Player',
    );
  }
}
