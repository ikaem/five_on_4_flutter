// TODO could this be used for the edit too? probably should, yeah

import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/cubits.dart';
import 'package:five_on_4_flutter/src/navigation/app_routes.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:five_on_4_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

typedef OnMatchCreateSuccess = void Function({
  required String matchId,
  required BuildContext context,
});

class MatchCreateScreen extends StatelessWidget {
  const MatchCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchesUseCases matchesUseCases = context.read<MatchesUseCases>();

    return BlocProvider(
      create: (context) => MatchCreateCubit(
        matchesUseCases: matchesUseCases,
      ),
      // TODO with this approach, we lose way to go back to existing inputs state - so maybe we should move the consumer into the view so that controllers could be reused if error, and user wants to go back to its inputs
      // TODO this should be moved below, to the view
      child: BlocConsumer<MatchCreateCubit, MatchCreateCubitState>(
        listener: _matchCreateCubitListener,
        builder: _matchCreateCubitBuilder,
      ),
    );
  }

  Widget _matchCreateCubitBuilder(
    BuildContext context,
    MatchCreateCubitState state,
  ) {
    return _MatchCreateView(
      onMatchCreateSuccess: _onMatchCreateSuccess,
    );
  }

  void _matchCreateCubitListener(
    BuildContext context,
    MatchCreateCubitState state,
  ) {
    // if (state is! MatchCreateCubitStateFailure) return;

    // context.showSnackBarMessage(
    //   'There was an error creating a new match',
    //   SnackBarVariant.error,
    // );

    state.when(
      initial: () => null,
      loading: () => null,
      failure: (message) => context.showSnackBarMessage(
        'There was an error creating a new match',
        SnackBarVariant.error,
      ),
      success: (matchId) {
        final String path = AppRoutes.match(matchId).path;

        context.pushReplacement(path);
      },
    );
  }

  void _onMatchCreateSuccess({
    required String matchId,
    required BuildContext context,
  }) {
    final Map<String, String> param = {
      'id': matchId,
    };

    final String path = AppRoutes.match(matchId).path;

    context.push(path);
  }
}

class _MatchCreateView extends StatefulWidget {
  const _MatchCreateView({required this.onMatchCreateSuccess});

  final OnMatchCreateSuccess onMatchCreateSuccess;

  @override
  State<_MatchCreateView> createState() => _MatchCreateViewState();
}

class _MatchCreateViewState extends State<_MatchCreateView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _organizerController = TextEditingController();
  final TextEditingController _timeAndDateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

// TODO not sure when should this be closed? should it be closed manually in dispose()?
  late final MatchCreateCubit _matchCreateCubit =
      context.read<MatchCreateCubit>();

  @override
  void initState() {
    _onWidgetInitialize();
    super.initState();
  }

  @override
  void dispose() {
    _onWidgetDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final MatchCreateCubitState createState = _matchCreateCubit.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new match'),
        actions: [
          StreamBuilder<bool>(
              stream: _matchCreateCubit.inputsValidationStream,
              builder: (context, snapshot) {
                final bool isValid = snapshot.data == true;

                return IconButton(
                  onPressed: isValid ? _handleMatchSubmit : null,
                  icon: Icon(
                    Icons.check,
                    color: isValid ? Colors.blue : Colors.red,
                  ),
                );
              })
        ],
      ),
      body: Column(
        children: [
          StreamBuilder<String>(
            builder: (context, snapshot) {
              final bool hasError = snapshot.hasError;

              return TextField(
                controller: _nameController,
                onChanged: (value) => _matchCreateCubit.onChangeName(value),
                decoration: InputDecoration(
                  labelText: 'Match name',
                  labelStyle: TextStyle(
                    color: hasError ? Colors.red : Colors.grey,
                  ),
                ),
              );
            },
            stream: _matchCreateCubit.nameStream,
          ),
          StreamBuilder<String>(
            builder: (context, snapshot) {
              final bool hasError = snapshot.hasError;

              return TextField(
                controller: _organizerController,
                onChanged: (value) =>
                    _matchCreateCubit.onChangeOrganizer(value),
                decoration: InputDecoration(
                  labelText: 'Orgnaizer name',
                  labelStyle: TextStyle(
                    color: hasError ? Colors.red : Colors.grey,
                  ),
                ),
              );
            },
            stream: _matchCreateCubit.organizerStream,
          ),
          StreamBuilder<String>(
            builder: (context, snapshot) {
              final bool hasError = snapshot.hasError;

              return TextField(
                controller: _timeAndDateController,
                onChanged: (value) =>
                    _matchCreateCubit.onChangeTimeAndDate(value),
                decoration: InputDecoration(
                  labelText: 'Time and date',
                  labelStyle: TextStyle(
                    color: hasError ? Colors.red : Colors.grey,
                  ),
                ),
              );
            },
            stream: _matchCreateCubit.timeAndDateStream,
          ),
          StreamBuilder<String>(
            builder: (context, snapshot) {
              final bool hasError = snapshot.hasError;

              return TextField(
                controller: _locationController,
                onChanged: (value) => _matchCreateCubit.onChangeLocation(value),
                decoration: InputDecoration(
                  labelText: 'Location',
                  labelStyle: TextStyle(
                    color: hasError ? Colors.red : Colors.grey,
                  ),
                ),
              );
            },
            stream: _matchCreateCubit.locationStream,
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     BlocSelector<MatchCreateCubit, MatchCreateCubitState, bool>(
      //       selector: (state) {
      //         final bool isNameError = state.nameError != null;
      //         return isNameError;
      //       },
      //       builder: (context, isNameError) {
      //         return TextField(
      //           controller: _nameController,
      //           onChanged: (value) => _matchCreateCubit.onChangeName(value),
      //           decoration: InputDecoration(
      //             labelText: 'Match name',
      //             labelStyle: TextStyle(
      //               color: isNameError ? Colors.red : Colors.grey,
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //     const SizedBox(
      //       height: SpacingConstants.xSmall,
      //     ),
      //     BlocSelector<MatchCreateCubit, MatchCreateCubitState, bool>(
      //       selector: (state) {
      //         final bool isOrganizerError = state.organizerError != null;
      //         return isOrganizerError;
      //       },
      //       builder: (context, isOrganizerError) {
      //         return TextField(
      //           controller: _organizerController,
      //           onChanged: (value) =>
      //               _matchCreateCubit.onChangeOrganizer(value),
      //           decoration: InputDecoration(
      //             labelText: 'Match organizer',
      //             labelStyle: TextStyle(
      //               color: isOrganizerError ? Colors.red : Colors.grey,
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //     const SizedBox(
      //       height: SpacingConstants.xSmall,
      //     ),
      //     BlocSelector<MatchCreateCubit, MatchCreateCubitState, bool>(
      //       selector: (state) {
      //         final bool isTimeAndDateError = state.timeAndDateError != null;
      //         return isTimeAndDateError;
      //       },
      //       builder: (context, isTimeAndDateError) {
      //         return TextField(
      //           controller: _timeAndDateController,
      //           onChanged: (value) =>
      //               _matchCreateCubit.onChangeTimeAndDate(value),
      //           decoration: InputDecoration(
      //             labelText: 'Match time',
      //             labelStyle: TextStyle(
      //               color: isTimeAndDateError ? Colors.red : Colors.grey,
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //     const SizedBox(
      //       height: SpacingConstants.xSmall,
      //     ),
      //     BlocSelector<MatchCreateCubit, MatchCreateCubitState, bool>(
      //       selector: (state) {
      //         final bool isLocationError = state.organizerError != null;
      //         return isLocationError;
      //       },
      //       builder: (context, isLocationError) {
      //         return TextField(
      //           controller: _locationController,
      //           onChanged: (value) => _matchCreateCubit.onChangeLocation(value),
      //           decoration: InputDecoration(
      //             labelText: 'Match organizer',
      //             labelStyle: TextStyle(
      //               color: isLocationError ? Colors.red : Colors.grey,
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }

  void _onWidgetDispose() {
    _locationController.dispose();
    _nameController.dispose();
    _organizerController.dispose();
    _timeAndDateController.dispose();

    // TODO not sure if this is needed - but we are not using bloc builder, so maybe
    _matchCreateCubit.close();
  }

  void _onWidgetInitialize() {
    // _matchCreateCubit.stream.listen((state) {
    //   final bool isSuccess = state.isSuccess == true && !state.isLoading;
    //   final bool isFailure = state.isFailure == true && !state.isLoading;

    //   if (isSuccess) {
    //     context.showSnackBarMessage('Match has been created successfully');
    //     return;
    //   }

    //   if (isFailure) {
    //     context.showSnackBarMessage(
    //       'There was an error creating the match',
    //       SnackBarVariant.error,
    //     );
    //     return;
    //   }
    // });
  }

  Future<void> _handleMatchSubmit() async {
    await _matchCreateCubit.onSubmit(
      name: _nameController.text,
      organizer: _organizerController.text,
      location: _locationController.text,
      timeAndDate: _timeAndDateController.text,
    );
// TODO not sure if bloc should be creating these values , and here jsut values are passed?

    // await _matchCreateCubit.onSubmit(
    //   name: _nameController.text,
    //   organizer: _organizerController.text,
    //   timeAndDate: _timeAndDateController.text,
    //   location: _timeAndDateController.text,
    // );
  }
}
