import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/blocs/match_get_my_next/cubit.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/blocs/matches_get_my_all/bloc.dart';
import 'package:five_on_4_flutter/src/features/weather/presentation/cubits/cubits.dart';
import 'package:five_on_4_flutter/src/navigation/app_routes.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/home_view/my_info_overview.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/home_view/home_view.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/home_view/my_next_match_overview.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/layout/app_bar_more_actions.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/layout/custom_app_bar.dart';
import 'package:five_on_4_flutter/src/theme/constants/color_constants.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:five_on_4_flutter/src/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorsTheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Karlo's matches"),
        actions: [
          AppBarMoreActions(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onCreateMatch(context: context),
        child: const Icon(Icons.sports_soccer),
        foregroundColor: colorsTheme.onSecondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SpacingConstants.small),
        child: Column(
          children: <Widget>[
            // this should be its own widget that would use some initial data bloc or something to get info about player
            MyInfoOverview(),
            SizedBox(
              height: SpacingConstants.xxLarge,
            ),

            // create proper widget from this,

            BlocConsumer<MatchGetMyNextCubit, MatchGetMyNextCubitState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              // make function out of this
              builder: (context, state) {
                return state.when(
                  initial: () => SizedBox.shrink(),
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                  failure: (message) => Center(child: Text(message)),
                  success: (matchInfo) {
                    return MyNextMatchOverview(matchInfo: matchInfo);
                  },
                );
              },
            ),
            SizedBox(
              height: SpacingConstants.xxLarge,
            ),

            // make widget out of this
            Expanded(
              child: Container(
                padding: EdgeInsets.all(SpacingConstants.small),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DimensionsConstants.d10),
                  color: ColorConstants.white,
                ),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final MatchModel match = MatchModel(id: id, name: name, joinedParticipants: joinedParticipants, invitedParticipants: invitedParticipants)
                    return Container(
                      child: Column(
                        children: [
                          Text()
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // BlocConsumer<MatchesGetMyTodaysBloc, MatchesGetMyTodaysBlocState>(
            //   listener: _matchesGetMyTodaysBlocListener,
            //   builder: _matchesGetMyTodaysBlocBuilder,
            // ),
            // const SizedBox(
            //   height: SpacingConstants.small,
            // ),
            // BlocConsumer<MatchesInvitedGetCubit, MatchesInvitedGetCubitState>(
            //   listener: (context, state) {
            //     // TODO: implement listener
            //   },
            //   builder: (context, state) {
            //     return state.when(
            //       matchesInvitedInitial: () => SizedBox.shrink(),
            //       matchesInvitedLoading: () =>
            //           Center(child: CircularProgressIndicator()),
            //       matchesInvitedError: (message) =>
            //           Center(child: Text('There was an error')),
            //       matchesInvitedLoaded: (matches) => MyInvitedMatchesOverview(
            //         matches: matches,
            //         onMatchBriefCardTap: _onGoToMatch,
            //       ),
            //     );

            //     // return MyInvitedMatchesOverview();
            //   },
            // ),
            // const SizedBox(
            //   height: SpacingConstants.small,
            // ),
            // BlocConsumer<WeatherGetCubit, WeatherGetCubitState>(
            //   listener: _weatherGetCubitListener,
            //   builder: _weatherGetCubitBuilder,
            // ),
            // const SizedBox(
            //   height: SpacingConstants.small,
            // ),
            // BlocConsumer<MatchesGetMyAllBloc, MatchesGetMyAllBlocState>(
            //   listener: _matchesGetMyAllBlocListener,
            //   builder: _matchesGetMyAllBlocBuilder,
            // ),
          ],
        ),
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
      success: (matches) => MyJoinedMatchesOverview(
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

  // Widget _matchesGetMyTodaysBlocBuilder(
  //   BuildContext context,
  //   MatchesGetMyTodaysBlocState state,
  // ) {
  //   return state.when(
  //     initial: () => const SizedBox.shrink(),
  //     loading: () => Center(
  //       child: Column(
  //         children: const [
  //           Text("Loading today's matches..."),
  //           CircularProgressIndicator()
  //         ],
  //       ),
  //     ),
  //     failure: (message) => Center(
  //       child: Column(
  //         children: [
  //           Text(message),
  //           const Icon(Icons.sports_soccer_sharp),
  //         ],
  //       ),
  //     ),
  //     success: (matches) => MyTodayMatchesOverview(
  //       onMatchBriefCardTap: _onGoToMatch,
  //       matches: matches,
  //     ),
  //   );
  // }

  // void _matchesGetMyTodaysBlocListener(
  //   BuildContext context,
  //   MatchesGetMyTodaysBlocState state,
  // ) {
  //   state.when(
  //     initial: () => null,
  //     loading: () => null,
  //     success: (weather) => null,
  //     failure: (message) =>
  //         context.showSnackBarMessage(message, SnackBarVariant.error),
  //   );
  // }

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
