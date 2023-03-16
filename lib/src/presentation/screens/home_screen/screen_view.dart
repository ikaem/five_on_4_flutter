import 'package:five_on_4_flutter/src/features/matches/matches.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/blocs/matches_get_my_all/bloc.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/blocs/matches_get_my_todays/bloc.dart';
import 'package:five_on_4_flutter/src/features/weather/presentation/cubits/cubits.dart';
import 'package:five_on_4_flutter/src/navigation/app_routes.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/home_view/home_view.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/layout/app_bar_more_actions.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:five_on_4_flutter/src/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
        actions: [
          AppBarMoreActions(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onCreateMatch(context: context),
        child: const Icon(Icons.sports_soccer),
      ),
      body: Column(
        children: <Widget>[
          BlocConsumer<MatchesGetMyTodaysBloc, MatchesGetMyTodaysBlocState>(
            listener: _matchesGetMyTodaysBlocListener,
            builder: _matchesGetMyTodaysBlocBuilder,
          ),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pending invitations'),
                MatchBriefCard(),
              ],
            ),
          ),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          BlocConsumer<WeatherGetCubit, WeatherGetCubitState>(
            listener: _weatherGetCubitListener,
            builder: _weatherGetCubitBuilder,
          ),
          const SizedBox(
            height: SpacingConstants.small,
          ),
          BlocConsumer<MatchesGetMyAllBloc, MatchesGetMyAllBlocState>(
            listener: _matchesGetMyAllBlocListener,
            builder: _matchesGetMyAllBlocBuilder,
          ),
        ],
      ),
    );
  }

  void _onCreateMatch({
    required BuildContext context,
  }) {
    final String path = AppRoutes.matchCreate.path;

    context.push(path);
  }

  void _onGoToMatch({
    required String matchId,
    required BuildContext context,
  }) {
    final Map<String, String> param = {
      'id': matchId,
    };

    final String path = AppRoutes.match(matchId).path;

    context.push(path);
  }

  // my all matches
  Widget _matchesGetMyAllBlocBuilder(
    BuildContext context,
    MatchesGetMyAllBlocState state,
  ) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => Center(
        child: Column(
          children: const [
            Text("Loading today's matches..."),
            CircularProgressIndicator()
          ],
        ),
      ),
      failure: (message) => Center(
        child: Column(
          children: [
            Text(message),
            const Icon(Icons.sports_soccer_sharp),
          ],
        ),
      ),
      success: (matches) => MyMatchesOverview(
        onMatchBriefCardTap: _onGoToMatch,
        matches: matches,
      ),
    );
  }

  void _matchesGetMyAllBlocListener(
    BuildContext context,
    MatchesGetMyAllBlocState state,
  ) {
    state.when(
      initial: () => null,
      loading: () => null,
      success: (weather) => null,
      failure: (message) =>
          context.showSnackBarMessage(message, SnackBarVariant.error),
    );
  }

  // my today's matches

  Widget _matchesGetMyTodaysBlocBuilder(
    BuildContext context,
    MatchesGetMyTodaysBlocState state,
  ) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => Center(
        child: Column(
          children: const [
            Text("Loading today's matches..."),
            CircularProgressIndicator()
          ],
        ),
      ),
      failure: (message) => Center(
        child: Column(
          children: [
            Text(message),
            const Icon(Icons.sports_soccer_sharp),
          ],
        ),
      ),
      success: (matches) => MyTodayMatchesOverview(
        onMatchBriefCardTap: _onGoToMatch,
        matches: matches,
      ),
    );
  }

  void _matchesGetMyTodaysBlocListener(
    BuildContext context,
    MatchesGetMyTodaysBlocState state,
  ) {
    state.when(
      initial: () => null,
      loading: () => null,
      success: (weather) => null,
      failure: (message) =>
          context.showSnackBarMessage(message, SnackBarVariant.error),
    );
  }

// weather
  Widget _weatherGetCubitBuilder(
    BuildContext context,
    WeatherGetCubitState state,
  ) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => Center(
        child: Column(
          children: const [
            Text("Loading today's weather..."),
            CircularProgressIndicator()
          ],
        ),
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
      success: (weather) => TodayWeather(
        weather: weather,
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
}
