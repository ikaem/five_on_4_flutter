import 'package:five_on_4_flutter/src/domain/domain.dart';

abstract class LocationRepository {
  Future<GeoCoordinatesValue> getCurrentPosition();
}
