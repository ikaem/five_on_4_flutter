import 'package:five_on_4_flutter/src/features/weather/data/data.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart';

class AppDataSources {
  AppDataSources({
    required this.httpWrapper,
    required this.locationWrapper,
    required this.appDatabase,
    // TODO eventually, we will provide database here as well
  });

  final HttpWrapper httpWrapper;
  final LocationWrapper locationWrapper;
  final AppDatabase appDatabase;

  late final WeatherRemoteDataSource weatherRemoteDataSource =
      WeatherRemoteAppDataSource(
    httpWrapper: httpWrapper,
  );
}
