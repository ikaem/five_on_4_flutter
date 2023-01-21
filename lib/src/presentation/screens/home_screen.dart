import 'package:five_on_4_flutter/src/features/weather/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/weather/presentation/cubits/cubits.dart';
import 'package:five_on_4_flutter/src/navigation/app_routes.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/widgets.dart'
    show MyMatchesOverview, MyTodayMatchesOverview, TodayWeather;
import 'package:five_on_4_flutter/src/theme/theme.dart' show SpacingConstants;
import 'package:five_on_4_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final WeatherUseCases weatherUseCases = context.read<WeatherUseCases>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherGetCubit>(
          create: (context) => WeatherGetCubit(weatherUseCases: weatherUseCases)
            ..loadHereAndNowWeather(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home screen'),
          actions: const [Icon(Icons.more_vert)],
        ),
        body: Column(
          children: <Widget>[
            // TODO - this porbably needs some match and weather passed in
            // TODO - maybe pass it in in form of some today data class model thing
            MyTodayMatchesOverview(
              onMatchBriefCardTap: _navigateToMatch,
            ),
            const SizedBox(
              height: SpacingConstants.small,
            ),
            const BlocConsumer<WeatherGetCubit, WeatherGetCubitState>(
              listener: _weatherGetCubitListener,
              builder: _weatherGetCubitBuilder,
            ),
            const SizedBox(
              height: SpacingConstants.small,
            ),
            MyMatchesOverview(
              onMatchBriefCardTap: _navigateToMatch,
            ),
          ],
        ),
      ),
    );
  }

  // TODO test
  void _navigateToMatch({
    required String matchId,
    required BuildContext context,
  }) {
    final Map<String, String> param = {
      'id': matchId.toString(),
    };

    final String path = AppRoutes.match(matchId).path;

    context.push(path);
  }
}

/* TODO why not declare it here, so it is not created again, the function */
Widget _weatherGetCubitBuilder(
  BuildContext context,
  WeatherGetCubitState state,
) {
  return state.when(
    initial: () => const SizedBox.shrink(),
    loading: () => Center(
      child: Column(
        children: const [
          Text('Loading today weather...'),
          CircularProgressIndicator()
        ],
      ),
    ),
    success: (weather) => TodayWeather(
      weather: weather,
    ),
    failure: (message) => Center(
      child: Column(
        children: const [
          // Text(message),
          Icon(Icons.cloud_off_outlined),
        ],
      ),
    ),
    locationDevicePermissionFailure: () => Center(
      child: Column(
        children: const [
          Text('Please allow location access on your device'),
          Icon(Icons.touch_app),
          // TODO put some button here to go those options
        ],
      ),
    ),
    locationDeviceServiceFailure: () => Center(
      child: Column(
        children: const [
          Text('Please enable location service on your device'),
          Icon(Icons.location_off),
        ],
      ),
    ),
  );
}

void _weatherGetCubitListener(
  BuildContext context,
  WeatherGetCubitState state,
) {
  state.when(
    initial: () => null,
    loading: () => null,
    success: (weather) => null,
    failure: (message) =>
        context.showSnackBarMessage(message, SnackBarVariant.error),
    locationDevicePermissionFailure: () => null,
    locationDeviceServiceFailure: () => null,
  );
}
