import 'package:five_on_4_flutter/src/app.dart';
import 'package:five_on_4_flutter/src/data/data_sources/app_data_sources.dart';
import 'package:five_on_4_flutter/src/data/repositories/app_repositories.dart';
import 'package:five_on_4_flutter/src/domain/use_cases/app_use_cases.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart';
import 'package:flutter/material.dart';

final rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');
final shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorKey');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppPaths appPaths = AppPaths();
  const FirebaseCoreWrapper firebaseCoreWrapper = FirebaseCoreWrapper();
  final AppDatabase appDatabase = AppDatabase(
    appPaths: appPaths,
  );

  await firebaseCoreWrapper.initializeFirebase();
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
  final SecureStorageWrapper secureStorageWrapper = SecureStorageWrapper();
  final FirebaseAuthWrapper firebaseAuthWrapper = FirebaseAuthWrapper();

  final AppDataSources appDataSources = AppDataSources(
    httpWrapper: httpWrapper,
    locationWrapper: locationWrapper,
    appDatabase: appDatabase,
    secureStorageWrapper: secureStorageWrapper,
    firebaseAuthWrapper: firebaseAuthWrapper,
  );

  final AppRepositories appRepositories = AppRepositories(
    appDataSources: appDataSources,
  );

  final AppUseCases appUseCases = AppUseCases(
    appRepositories: appRepositories,
  );

  return appUseCases;
}
