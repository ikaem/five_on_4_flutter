// TODO we are making it a bloc because we want to use stopping event request if another one arrives - and we want to use debouncing

import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_events.dart';
part 'bloc_state.dart';
part 'bloc.freezed.dart';

class MatchesGetMyTodaysBloc
    extends Bloc<MatchesGetMyTodaysBlocState, MatchesGetMyTodaysBlocEvent> {
  MatchesGetMyTodaysBloc({
    required this.matchesUseCases,
  }) : super(MatchesGetMyTodaysBlocStateInitial()) {
    _registerEventHandlers();
  }

  final MatchesUseCases matchesUseCases;

  void _registerEventHandlers() {
    // TODO register all events here
  }
}
