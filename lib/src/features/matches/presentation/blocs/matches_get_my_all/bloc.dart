// TODO we are making it a bloc because we want to use stopping event request if another one arrives - and we want to use debouncing

import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_events.dart';
part 'bloc_state.dart';
part 'bloc.freezed.dart';

class MatchesGetMyAllBloc
    extends Bloc<MatchesGetMyAllBlocEvent, MatchesGetMyAllBlocState> {
  MatchesGetMyAllBloc({
    required this.matchesUseCases,
  }) : super(MatchesGetMyAllBlocStateInitial()) {
    _registerEventHandlers();
  }

  final MatchesUseCases matchesUseCases;

  void _registerEventHandlers() {
    // TODO register all events here
    on<MatchesGetMyAllBlocLoadMatchesEvent>(_onMatchesLoad);
  }

  Future<void> _onMatchesLoad(
    MatchesGetMyAllBlocLoadMatchesEvent event,
    Emitter<MatchesGetMyAllBlocState> emitter,
  ) async {
    emitter(MatchesGetMyAllBlocStateLoading());
    // TODO, LATER, do make sure that we first provide local maches to the staste, and only then to we go and fetch remote ones

    try {
      // TODO eventually, this will require a pagination of some sort
      final List<MatchModel> matches = await matchesUseCases.getMyAllMatches();

      emitter(MatchesGetMyAllBlocStateSuccess(matches: matches));
    } catch (e) {
      emitter(
        MatchesGetMyAllBlocStateFailure(
          message: 'Failed to retrive your matches',
        ),
      );
    }
  }
}
