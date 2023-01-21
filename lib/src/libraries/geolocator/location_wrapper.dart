import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:geolocator/geolocator.dart';

export 'location_wrapper.dart';

class LocationWrapper {
  Future<GeoCoordinatesValue> getCurrentPosition() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error(
        const LocationWrapperServiceDisabledException(
          message: 'Location services are disabled',
        ),
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // check permissiona gain
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error(
          const LocationWrapperPermissionDeniedException(
            message: 'Permission is denied',
          ),
        );
      }
    }

    // now we check if we have persissions deined forever
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        const LocationWrapperPermissionDeniedException(
          message: 'Permission is deined forever',
        ),
      );
    }

    final Position position = await Geolocator.getCurrentPosition();

    final GeoCoordinatesValue coordinates = GeoCoordinatesValue(
      longitude: position.longitude,
      latitude: position.latitude,
    );
    return coordinates;
  }
}
