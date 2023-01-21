import 'package:five_on_4_flutter/src/app.dart';
import 'package:five_on_4_flutter/src/data/data_sources/app_data_sources.dart';
import 'package:five_on_4_flutter/src/data/repositories/app_repositories.dart';
import 'package:five_on_4_flutter/src/domain/use_cases/app_use_cases.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart%20';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppPaths appPaths = AppPaths();
  final AppDatabase appDatabase = AppDatabase(
    appPaths: appPaths,
  );

  await appDatabase.initialize();

  final AppUseCases appUseCases =
      _getInitializedAppUseCases(appDatabase: appDatabase);

  runApp(
    FiveOn4App(
      appUseCases: appUseCases,
    ),
  );
}

AppUseCases _getInitializedAppUseCases({
  required AppDatabase appDatabase,
}) {
  final HttpWrapper httpWrapper = HttpWrapper();
  final LocationWrapper locationWrapper = LocationWrapper();

  final AppDataSources appDataSources = AppDataSources(
    httpWrapper: httpWrapper,
    locationWrapper: locationWrapper,
    appDatabase: appDatabase,
  );

  final AppRepositories appRepositories = AppRepositories(
    appDataSources: appDataSources,
  );

  final AppUseCases appUseCases = AppUseCases(
    appRepositories: appRepositories,
  );

  return appUseCases;
}
