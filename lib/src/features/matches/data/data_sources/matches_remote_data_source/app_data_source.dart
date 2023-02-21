import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_join/match_join.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_4_flutter/src/libraries/firebase/firebase.dart';

class MatchesRemoteAppDataSource implements MatchesRemoteDataSource {
  static const String firestoreCollection = 'matches';

  const MatchesRemoteAppDataSource({
    required FirestoreWrapper firestoreWrapper,
  }) : _firestoreWrapper = firestoreWrapper;

  final FirestoreWrapper _firestoreWrapper;

  @override
  Future<MatchRemoteDTO> getMatch(String id) async {
    throw '';
  }

  @override
  Future<List<MatchRemoteDTO>> getMatches() async {
    await _firestoreWrapper.getOneMatch();
    // TODO old - this actually works for all matches because we dont need exact participants there
    // final List<QueryDocumentSnapshot<Map<String, dynamic>>> response =
    //     await _firestoreWrapper.getCollectionItems(
    //         collectionPath: firestoreCollection);

    // final test = response.map((e) {
    //   final data = e.data();
    //   // TODO test

    //   return data;
    // }).toList();

    // final what = test.map((t) {
    //   final tester = t;
    //   // TODO tw

    //   final participants = t['participant'];

    //   // TODO test
    // }).toList();

    // // final List<MatchRemoteDTO> dtos =
    // //     response.map((map) => MatchRemoteDTO.fromFirestore(map)).toList();

    return [];
  }

  @override
  Future<String> createMatch(NewMatchValue newMatch) async {
    throw 'something';
  }

  @override
  Future<void> joinMatch(MatchJoinArgs args) async {
    throw 'something';
  }

  @override
  Future<void> unjoinMatch(MatchJoinArgs args) async {
    throw 'something';
  }
}
