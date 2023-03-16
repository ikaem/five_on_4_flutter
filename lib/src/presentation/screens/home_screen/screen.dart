import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/blocs/matches_get_my_all/bloc.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/blocs/matches_get_my_todays/bloc.dart';
import 'package:five_on_4_flutter/src/features/weather/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/weather/presentation/cubits/cubits.dart';
import 'package:five_on_4_flutter/src/presentation/screens/home_screen/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherUseCases weatherUseCases = context.read<WeatherUseCases>();
    final MatchesUseCases matchesUseCases = context.read<MatchesUseCases>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherGetCubit>(
          create: (context) => WeatherGetCubit(weatherUseCases: weatherUseCases)
            ..loadHereAndNowWeather(),
        ),
        BlocProvider<MatchesGetMyTodaysBloc>(
          create: (context) =>
              MatchesGetMyTodaysBloc(matchesUseCases: matchesUseCases)
                ..add(MatchesGetMyTodaysBlocLoadMatchesEvent()),
        ),
        BlocProvider<MatchesGetMyAllBloc>(
          create: (context) =>
              MatchesGetMyAllBloc(matchesUseCases: matchesUseCases)
                ..add(MatchesGetMyAllBlocLoadMatchesEvent()),
        ),
      ],
      child: const HomeScreenView(),
    );
  }
}
