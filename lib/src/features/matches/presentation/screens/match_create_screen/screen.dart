// TODO could this be used for the edit too? probably should, yeah

import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/presentation/cubits/cubits.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:five_on_4_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return const _MatchCreateView();
  }

  void _matchCreateCubitListener(
    BuildContext context,
    MatchCreateCubitState state,
  ) {
    if (state.isSuccess != false) return;

    context.showSnackBarMessage(
      'There was an error creating a new match',
      SnackBarVariant.error,
    );
  }
}

class _MatchCreateView extends StatefulWidget {
  const _MatchCreateView();

  @override
  State<_MatchCreateView> createState() => _MatchCreateViewState();
}

class _MatchCreateViewState extends State<_MatchCreateView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _organizerController = TextEditingController();
  final TextEditingController _timeAndDateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  late final MatchCreateCubit _matchCreateCubit =
      context.read<MatchCreateCubit>();

  @override
  void dispose() {
    _onWidgetDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MatchCreateCubitState createState = _matchCreateCubit.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new match'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            onChanged: (value) => _matchCreateCubit.onChangeName(value),
            decoration: InputDecoration(
              labelText: 'Match name',
              labelStyle: TextStyle(
                color: createState.nameError == null ? Colors.grey : Colors.red,
              ),
            ),
          ),
          const SizedBox(
            height: SpacingConstants.xSmall,
          ),
          TextField(
            controller: _organizerController,
            decoration: const InputDecoration(
              labelText: 'Match organizer',
            ),
          ),
          const SizedBox(
            height: SpacingConstants.xSmall,
          ),
          TextField(
            controller: _timeAndDateController,
            decoration: const InputDecoration(
              labelText: 'Match time',
            ),
          ),
          const SizedBox(
            height: SpacingConstants.xSmall,
          ),
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(
              labelText: 'Match location',
            ),
          ),
        ],
      ),
    );
  }

  void _onWidgetDispose() {
    _locationController.dispose();
    _nameController.dispose();
    _organizerController.dispose();
    _timeAndDateController.dispose();
  }
}
