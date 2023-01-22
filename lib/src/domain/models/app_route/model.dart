import 'package:flutter/material.dart';

// TODO this is probably a value, and not a mode - cannot do anyhting on it
@immutable
class AppRouteModel {
  const AppRouteModel({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
}
