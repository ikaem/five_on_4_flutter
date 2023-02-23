import 'package:five_on_4_flutter/src/navigation/app_router.dart';
import 'package:five_on_4_flutter/src/presentation/cubits/initial_data/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FiveOn4App extends StatelessWidget {
  const FiveOn4App({super.key});

  @override
  Widget build(BuildContext context) {
    // final AuthStatusCubit authStatusCubit = context.read<AuthStatusCubit>();
    // final LogoutCubit logoutCubit = context.read<LogoutCubit>();
    final InitialDataCubit initialDataCubit = context.read<InitialDataCubit>();

// potentually make some utils multirepository provider in future
    final AppRouter appRouter = AppRouter(
      initialDataProvider: initialDataCubit.initialDataProvider,
    );

    return MaterialApp.router(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      routeInformationProvider: appRouter.router.routeInformationProvider,
      routeInformationParser: appRouter.router.routeInformationParser,
      routerDelegate: appRouter.router.routerDelegate,
    );
  }
}
