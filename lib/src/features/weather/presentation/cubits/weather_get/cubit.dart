import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/weather/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit.freezed.dart';
part 'cubit_state.dart';

class WeatherGetCubit extends Cubit<WeatherGetCubitState> {
  WeatherGetCubit({
    required this.weatherUseCases,
    // TODO potentiually, we could get connection repo here as well - but then we mix stuff - prefer it in use cases
  }) : super(WeatherGetCubitStateInitial());

  final WeatherUseCases weatherUseCases;

  Future<void> loadHereAndNowWeather() async {
    emit(WeatherGetCubitStateLoading());
    try {
// TODO maybe we can have use cases return location to us as well

//
      final WeatherModel weather = await weatherUseCases.getHereAndNowWeather();

      emit(WeatherGetCubitStateSuccess(weather: weather));
    } on LocationWrapperServiceDisabledException {
      emit(
        WeatherGetCubitStateLocationDevicePermissionFailure(),
      );
    } on LocationWrapperPermissionDeniedException {
      emit(
        WeatherGetCubitStateLocationDeviceServiceFailure(),
      );
    } catch (e) {
// TODO we should probably log this
// TODO also, we probably have error message better info in the error itself
      emit(
        WeatherGetCubitStateFailure(
          message: 'There was an error fetching weather info',
        ),
      );
    }
  }
}
