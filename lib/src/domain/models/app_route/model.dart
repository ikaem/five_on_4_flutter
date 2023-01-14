import 'package:flutter/material.dart';

@immutable
class AppRouteModel {
  const AppRouteModel({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
}
