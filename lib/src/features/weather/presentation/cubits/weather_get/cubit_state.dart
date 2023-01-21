part of 'cubit.dart';

@freezed
class WeatherGetCubitState with _$WeatherGetCubitState {
  factory WeatherGetCubitState.initial() = WeatherGetCubitStateInitial;
  factory WeatherGetCubitState.loading() = WeatherGetCubitStateLoading;
  factory WeatherGetCubitState.success({
    required WeatherModel weather,
  }) = WeatherGetCubitStateSuccess;
  factory WeatherGetCubitState.failure({
    required String message,
  }) = WeatherGetCubitStateFailure;
  factory WeatherGetCubitState.locationDevicePermissionFailure() =
      WeatherGetCubitStateLocationDevicePermissionFailure;
  factory WeatherGetCubitState.locationDeviceServiceFailure() =
      WeatherGetCubitStateLocationDeviceServiceFailure;
}
