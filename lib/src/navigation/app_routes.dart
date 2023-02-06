import 'package:five_on_4_flutter/src/domain/models/models.dart';

abstract class AppRoutes {
  static const String idPlaceholder = ':id';

  static AppRouteModel get home => const AppRouteModel(
        path: '/',
        name: 'Home',
      );

  static AppRouteModel get login => const AppRouteModel(
        path: '/login',
        name: 'Login',
      );

  static AppRouteModel get matches => const AppRouteModel(
        path: '/matches',
        name: 'Matches',
      );

  static AppRouteModel get players => const AppRouteModel(
        path: '/players',
        name: 'Players',
      );

  static AppRouteModel get matchCreate => const AppRouteModel(
        path: '/match-create',
        name: 'MatchCreate',
      );

  static AppRouteModel match([String? id]) {
    final String matchId = id ?? idPlaceholder;

    return AppRouteModel(
      path: '/matches/$matchId',
      name: 'Match',
    );
  }

  static AppRouteModel player([String? id]) {
    final String player = id ?? idPlaceholder;

    return AppRouteModel(
      path: '/players/$player',
      name: 'Player',
    );
  }
}
