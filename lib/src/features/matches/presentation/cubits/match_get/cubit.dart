import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit.freezed.dart';
part 'cubit_state.dart';

class MatchGetCubit extends Cubit<MatchGetCubitState> {
  MatchGetCubit({
    required this.matchesUseCases,
  }) : super(MatchGetCubitStateInitial());

  final MatchesUseCases matchesUseCases;

// TODO question here is if we want to load the match immediately and pass mathc id to the cubit when we isntantiate it - or, do we want to pass match id on load
// lets call load match from ui, so it is explicit what is going on, and also, so we dont do it in the cosntructor - ui should worry about these evetn maybe?
  Future<void> loadMatch(String id) async {
    emit(MatchGetCubitStateLoading());

    try {
      final MatchModel match = await matchesUseCases.getMatch(id);
      emit(MatchGetCubitStateSuccess(match: match));
    } catch (e) {
      emit(
        MatchGetCubitStateFailure(
          message: 'There was an error fetcing match',
        ),
      );
    }
  }
}
