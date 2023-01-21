import 'package:five_on_4_flutter/src/domain/use_cases/app_use_cases.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart';
import 'package:five_on_4_flutter/src/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FiveOn4App extends StatelessWidget {
  const FiveOn4App({
    super.key,
    required this.appUseCases,
  });

  final AppUseCases appUseCases;

  @override
  Widget build(BuildContext context) {
    return AppUseCasesProvider(
      appUseCases: appUseCases,
      child: MaterialApp.router(
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
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
      ),
    );
  }
}
