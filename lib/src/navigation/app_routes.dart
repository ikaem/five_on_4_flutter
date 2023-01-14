import 'package:five_on_4_flutter/src/domain/models/models.dart';

abstract class AppRoutes {
  static const AppRouteModel home = AppRouteModel(path: "/", name: "Home");

  static const AppRouteModel matches =
      AppRouteModel(path: "/matches", name: "Matches");

  static const AppRouteModel players =
      AppRouteModel(path: "/players", name: "Players");
}
