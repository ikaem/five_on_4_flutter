import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

class MatchesInvitedGetCubit extends Cubit<MatchesInvitedGetCubitState> {
  MatchesInvitedGetCubit({
    required this.matchesUseCases,
  }) : super(MatchesInvitedGetCubitStateInitial());

  final MatchesUseCases matchesUseCases;

  Future<void> getMyInvitedMatches() async {
    emit(MatchesInvitedGetCubitStateLoading());

    try {
      final invitedMatches = await matchesUseCases.getMyTodaysMatches();
      emit(MatchesInvitedGetCubitStateLoaded(invitedMatches));
    } catch (e) {
      emit(MatchesInvitedGetCubitStateError(e.toString()));
    }
  }
}
