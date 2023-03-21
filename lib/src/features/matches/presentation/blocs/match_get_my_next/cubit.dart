// TODO we are making it a bloc because we want to use stopping event request if another one arrives - and we want to use debouncing

import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/models/match_info/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.dart';
part 'cubit.freezed.dart';

class MatchGetMyNextCubit extends Cubit<MatchGetMyNextCubitState> {
  MatchGetMyNextCubit({
    required this.matchesUseCases,
  }) : super(MatchGetMyNextCubitStateInitial());

  final MatchesUseCases matchesUseCases;

  Future<void> onMatchLoad() async {
    emit(MatchGetMyNextCubitStateLoading());

    try {
      final MatchInfoModel matchInfo =
          await matchesUseCases.getMyNextMatchInfo();

      emit(MatchGetMyNextCubitStateSuccess(match: matchInfo));
    } catch (e) {
      emit(MatchGetMyNextCubitStateFailure(
        message: "Failed to retrive your today's matches",
      ));
    }
  }

  // void _registerEventHandlers() {
  //   // TODO register all events here
  //   on<MatchesGetMyTodaysBlocLoadMatchesEvent>(_onMatchesLoad);
  // }

  // Future<void> _onMatchesLoad(
  //   MatchesGetMyTodaysBlocLoadMatchesEvent event,
  //   Emitter<MatchesGetMyTodaysBlocState> emitter,
  // ) async {
  //   emitter(MatchesGetMyTodaysBlocStateLoading());
  //   // TODO, LATER, do make sure that we first provide local maches to the staste, and only then to we go and fetch remote ones

  //   try {
  //     // TODO eventually, this will require a pagination of some sort
  //     final List<MatchModel> matches =
  //         await matchesUseCases.getMyNextMatchInfo();

  //     emitter(MatchesGetMyTodaysBlocStateSuccess(matches: matches));
  //   } catch (e) {
  //     emitter(
  //       MatchesGetMyTodaysBlocStateFailure(
  //         message: "Failed to retrive your today's matches",
  //       ),
  //     );
  //   }
  // }
}
