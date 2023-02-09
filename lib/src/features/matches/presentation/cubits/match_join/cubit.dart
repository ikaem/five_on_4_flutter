import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit.freezed.dart';
part 'cubit_state.dart';

class MatchJoinCubit extends Cubit<MatchJoinCubitState> {
  MatchJoinCubit({
    required this.matchesUseCases,
  }) : super(MatchJoinCubitStateInitial());

  final MatchesUseCases matchesUseCases;

// TODO question here is if we want to load the match immediately and pass mathc id to the cubit when we isntantiate it - or, do we want to pass match id on load
// lets call load match from ui, so it is explicit what is going on, and also, so we dont do it in the cosntructor - ui should worry about these evetn maybe?
  Future<void> participateInMatch({
    required String matchId,
    required bool shouldJoin,
  }) async {
    emit(MatchJoinCubitStateLoading());

    try {
      await matchesUseCases.participateInMatch(
        matchId: matchId,
        // TODO this could prtobably be an enum to indicate whether we joined
        shouldJoin: shouldJoin,
      );
      // pass enum here of join intention, and let ui do with it what it wants
      emit(MatchJoinCubitStateSuccess(matchId));
    } catch (e) {
      final String message = shouldJoin
          ? 'There was an error joining the match'
          : 'There was an error leaving the match';
      emit(
        MatchJoinCubitStateFailure(
          message: message,
        ),
      );
    }
  }
}
