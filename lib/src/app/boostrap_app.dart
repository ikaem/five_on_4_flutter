import 'package:five_on_4_flutter/src/app/app.dart';
import 'package:five_on_4_flutter/src/domain/use_cases/app_use_cases.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart';
import 'package:five_on_4_flutter/src/presentation/cubits/initial_data/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BootstrapFiveOn4App extends StatelessWidget {
  const BootstrapFiveOn4App({
    super.key,
    required this.appUseCases,
  });

  final AppUseCases appUseCases;

  @override
  Widget build(BuildContext context) {
    return AppUseCasesProvider(
      appUseCases: appUseCases,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InitialDataCubit(
              initialDataUseCases: appUseCases.initialDataUseCases,
            ),
          ),
        ],
        child: FiveOn4App(),
      ),
    );
  }
}
