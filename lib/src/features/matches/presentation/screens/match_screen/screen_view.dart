import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/extensions/extensions.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/match_get/cubit.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/match_join/cubit.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/widgets/match_content.dart';
import 'package:five_on_4_flutter/src/presentation/widgets/layout/app_bar_more_actions.dart';
import 'package:five_on_4_flutter/src/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchScreenView extends StatefulWidget {
  const MatchScreenView({
    super.key,
  });

  @override
  State<MatchScreenView> createState() => _MatchScreenViewState();
}

class _MatchScreenViewState extends State<MatchScreenView> {
  late final MatchJoinCubit _matchJoinCubit = context.read<MatchJoinCubit>();
  late final MatchGetCubit _matchGetCubit = context.read<MatchGetCubit>();
  // late final AuthStatusCubit _authStatusCubit = context.read<AuthStatusCubit>();

  @override
  void initState() {
    super.initState();
    _initializeView();
  }

  @override
  void dispose() {
    _disposeView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // log('${_authStatusCubit.auth?.email}');

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
      success: _matchGetCubitSuccessBuilder,
    );
  }

  Scaffold _matchGetCubitSuccessBuilder(MatchModel match) {
    final bool hasUserJoinedMatch = match.checkHasUserJoinedMatch(playerId: '');

    final IconData joinIcon =
        !hasUserJoinedMatch ? Icons.person_add : Icons.person_remove;

    return Scaffold(
      appBar: AppBar(
        title: Text('Match details'),
        actions: [
          BlocSelector<MatchJoinCubit, MatchJoinCubitState, bool>(
            selector: (state) {
              return state is MatchJoinCubitStateLoading;
            },
            builder: (context, isLoading) {
              return IconButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        // TODO test
                        await _matchJoinCubit.participateInMatch(
                          matchId: match.id,
                          shouldJoin: !hasUserJoinedMatch,
                        );
                      },
                icon: Icon(joinIcon),
              );
            },
          ),
          AppBarMoreActions(),
        ],
      ),
      body: MatchContent(
        match: match,
      ),
    );
  }

  void _initializeView() {
    _matchJoinCubit.stream.listen(
      (state) {
        state.when(
          initial: () => null,
          loading: () => null,
          success: (matchId) {
            _matchGetCubit.loadMatch(matchId);
            context.showSnackBarMessage('Match joined successfully');
          },
          failure: (message) =>
              context.showSnackBarMessage(message, SnackBarVariant.error),
        );
      },
    );
  }

  void _disposeView() {
    // bloc is closed automatically with bloc provider from the bloc screen
    // _matchJoinCubit.close();
  }
}
