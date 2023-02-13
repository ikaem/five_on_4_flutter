import 'package:five_on_4_flutter/src/features/auth/auth.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data_sources/matches_remote_data_source/fake_data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/fake_data_source.dart';
import 'package:five_on_4_flutter/src/features/weather/data/data.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart';

class AppDataSources {
  AppDataSources({
    required this.httpWrapper,
    required this.locationWrapper,
    required this.appDatabase,
    required this.secureStorageWrapper,
    required this.firebaseAuthWrapper,
    // TODO eventually, we will provide database here as well
  });

  final HttpWrapper httpWrapper;
  final LocationWrapper locationWrapper;
  final AppDatabase appDatabase;
  final SecureStorageWrapper secureStorageWrapper;
  final FirebaseAuthWrapper firebaseAuthWrapper;

  late final WeatherRemoteDataSource weatherRemoteDataSource =
      WeatherRemoteAppDataSource(
    httpWrapper: httpWrapper,
  );

// TODO fake is tempo
  late final MatchesRemoteDataSource matchesRemoteDataSource =
      MatchesRemoteFakeDataSource();

  late final MatchesLocalDataSource matchesLocalDataSource =
      MatchesLocalAppDataSource(
    appDatabase: appDatabase,
  );

  late final AuthLocalDataSource authLocalDataSource = AuthLocalAppDataSource(
    secureStorageWrapper: secureStorageWrapper,
  );

  late final AuthRemoteDataSource authRemoteDataSource =
      AuthRemoteAppDataSource(
    firebaseAuthWrapper: firebaseAuthWrapper,
  );

  late final PlayersRemoteDataSource playersRemoteDataSource =
      PlayersFakeDataSource();
}
