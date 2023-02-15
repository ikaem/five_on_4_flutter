import 'package:five_on_4_flutter/src/domain/values/initial_data/value.dart';

abstract class InitialDataUseCases {
  // TODO possibly create a value to transfer this data
  Stream<InitialDataValue> get initialDataStream;
  Future<void> onAuthCheckOnAppStart();
  Future<void> onLoadCurrentPlayer(String authId);
  // TODO this is like logout of sorts
  Future<void> initialDataClear();
}
