import 'package:five_on_4_flutter/src/data/repositories/location_repository/repository.dart';
import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart';

class LocationAppRepository implements LocationRepository {
  const LocationAppRepository({
    required this.locationWrapper,
  });

  final LocationWrapper locationWrapper;

  @override
  Future<GeoCoordinatesValue> getCurrentPosition() async {
    final GeoCoordinatesValue coordinates =
        await locationWrapper.getCurrentPosition();

    return coordinates;
    // TODO this will throw errors in case of service disabled and no pemrissions, so we can handle them in some bloc
  }
}
