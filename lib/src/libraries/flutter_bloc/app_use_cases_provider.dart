import 'package:five_on_4_flutter/src/domain/use_cases/app_use_cases.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/weather/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppUseCasesProvider extends StatelessWidget {
  const AppUseCasesProvider({
    super.key,
    required this.child,
    required this.appUseCases,
  });

  final Widget child;
  final AppUseCases appUseCases;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherUseCases>(
          create: (context) => appUseCases.weatherUseCases,
        ),
        RepositoryProvider<MatchesUseCases>(
          create: (context) => appUseCases.matchesUseCases,
        ),
      ],
      child: child,
    );
  }
}
