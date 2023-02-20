import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/presentation/cubits/initial_data/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarMoreActions extends StatelessWidget {
  const AppBarMoreActions({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<AppBarMoreAction>(
      onSelected: _onSelected(context),
      itemBuilder: _itemBuilder,
    );

    // final AuthUseCases authUseCases = context.read<AuthUseCases>();

    // return MultiBlocProvider(
    //   providers: [
    //     // TODO testing this
    //     // BlocProvider<LogoutCubit>(
    //     //   create: (context) => LogoutCubit(authUseCases: authUseCases),
    //     // ),
    //   ],
    //   child: Builder(
    //     builder: (context) {
    //       return PopupMenuButton<AppBarMoreAction>(
    //         onSelected: _onSelected(context),
    //         itemBuilder: _itemBuilder,
    //       );
    //     },
    //   ),
    // );
  }

  Future<void> Function(AppBarMoreAction) _onSelected(BuildContext context) =>
      (AppBarMoreAction action) async {
        // final LogoutCubit logoutCubit = context.read<LogoutCubit>();
        final InitialDataCubit initialDataCubit =
            context.read<InitialDataCubit>();

        switch (action) {
          case AppBarMoreAction.logout:
            await initialDataCubit.clearInitialData();
            return;

          default:
            return;
        }
      };

  List<PopupMenuEntry<AppBarMoreAction>> _itemBuilder(BuildContext context) {
    return [
      const PopupMenuItem(
        value: AppBarMoreAction.logout,
        child: Text('Logout'),
      ),
    ];
  }
}
