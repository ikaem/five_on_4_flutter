import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/match_get/cubit.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/widgets/match_content.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/layout/app_bar_more_actions.dart';
import 'package:five_on_4_flutter/src/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchScreenView extends StatelessWidget {
  const MatchScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MatchGetCubit, MatchGetCubitState>(
      listener: _matchGetCubitListener,
      builder: _matchGetCubitBuilder,
    );
  }

  void _matchGetCubitListener(
    BuildContext context,
    MatchGetCubitState state,
  ) {
    state.when(
      initial: () => null,
      loading: () => null,
      success: (match) => null,
      failure: (message) => context.showSnackBarMessage(
        message,
        SnackBarVariant.error,
      ),
    );
  }

  Widget _matchGetCubitBuilder(
    BuildContext context,
    MatchGetCubitState state,
  ) {
    final Size size = MediaQuery.of(context).size;

    return state.when(
      initial: () => ColoredBox(
        color: Colors.white,
      ),
      loading: () => Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Center(child: CircularProgressIndicator()),
      ),
      failure: (message) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(message)),
      ),
      success: (match) => Scaffold(
        appBar: AppBar(
          title: Text('Match details'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.person_add)),
            AppBarMoreActions(),
          ],
        ),
        body: MatchContent(
          match: match,
        ),
      ),
    );
  }
}
