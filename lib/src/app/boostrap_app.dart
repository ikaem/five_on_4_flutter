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
    // final AuthStatusProvider authStatusProvider = AuthStatusProvider();

    return AppUseCasesProvider(
      appUseCases: appUseCases,
      // TODO eventually make appBlocsProvider
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InitialDataCubit(
              initialDataUseCases: appUseCases.initialDataUseCases,
            ),
          ),
          // BlocProvider(
          //   create: (context) => AuthStatusCubit(
          //     authUseCases: appUseCases.authUseCases,
          //     authStatusProvider: authStatusProvider,
          //   ),
          // ),
          // BlocProvider(
          //   create: (context) => PlayerCurrentCubit(
          //     playersUseCases: appUseCases.playersUseCases,
          //   ),
          // ),
          // TODO testing this here
          // TODO this is not needed because that initial will be used to logout and clear initial data
          // BlocProvider<LogoutCubit>(
          //   create: (context) =>
          //       LogoutCubit(authUseCases: appUseCases.authUseCases),
          // ),
        ],
        child: FiveOn4App(),
        // child: Builder(builder: (context) {
        //   // final AuthStatusCubit authStatusCubit =
        //   //     context.read<AuthStatusCubit>();

        //   final AppRouter appRouter = AppRouter(
        //     authStatusProvider: authStatusProvider,
        //   );

        //   return MaterialApp.router(
        //     restorationScopeId: 'app',
        //     localizationsDelegates: const [
        //       AppLocalizations.delegate,
        //       GlobalMaterialLocalizations.delegate,
        //       GlobalWidgetsLocalizations.delegate,
        //       GlobalCupertinoLocalizations.delegate,
        //     ],
        //     supportedLocales: const [
        //       Locale('en', ''), // English, no country code
        //     ],
        //     onGenerateTitle: (BuildContext context) =>
        //         AppLocalizations.of(context)!.appTitle,
        //     theme: ThemeData(),
        //     darkTheme: ThemeData.dark(),
        //     themeMode: ThemeMode.dark,
        //     routeInformationProvider: appRouter.router.routeInformationProvider,
        //     routeInformationParser: appRouter.router.routeInformationParser,
        //     routerDelegate: appRouter.router.routerDelegate,
        //   );
        // }),
      ),
    );
  }
}
