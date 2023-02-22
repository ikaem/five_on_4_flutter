import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_join/match_join.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_4_flutter/src/libraries/firebase/firebase.dart';

class MatchesRemoteAppDataSource implements MatchesRemoteDataSource {
  static const String firestoreMatchCollection = 'matches';
  static const String firestoreMatchPartipantsSubcollection =
      'match_participants';

  const MatchesRemoteAppDataSource({
    required FirestoreWrapper firestoreWrapper,
  }) : _firestoreWrapper = firestoreWrapper;

  final FirestoreWrapper _firestoreWrapper;

  @override
  Future<MatchRemoteDTO> getMatch(String id) async {
    final DocumentSnapshot<Map<String, dynamic>> matchResponse =
        await _firestoreWrapper.getCollectionItem(
      collectionName: firestoreMatchCollection,
      itemId: id,
    );

    final Map<String, dynamic>? matchData = matchResponse.data();
    // TODO create better exception for this
    if (matchData == null) throw 'No such match exception';

    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        matchParticipantsResponse =
        await _firestoreWrapper.getSubcollectionItems(
      collectionName: firestoreMatchCollection,
      itemId: id,
      subcollectionName: firestoreMatchPartipantsSubcollection,
    );

    final MatchRemoteDTO matchRemoteDTO = MatchRemoteDTO.fromFirestoreSnapshots(
      matchSnapshot: matchResponse,
      participantsSnapshots: matchParticipantsResponse,
    );

    return matchRemoteDTO;
  }

  @override
  Future<List<MatchRemoteDTO>> getMatches() async {
    // await _firestoreWrapper.getOneMatch();
    // TODO old - this actually works for all matches because we dont need exact participants there
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> response =
        await _firestoreWrapper.getCollectionItems(
            collectionPath: firestoreMatchCollection);

    final List<MatchRemoteDTO> dtos =
        _generateMatchDTOsFromFirestoreResponse(response);

    return dtos;
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

  // TODO transform
  List<MatchRemoteDTO> _generateMatchDTOsFromFirestoreResponse(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> response) {
    final List<MatchRemoteDTO> dtos = response.map((snapshot) {
      final MatchRemoteDTO dto = MatchRemoteDTO.fromFirestoreSnapshots(
        matchSnapshot: snapshot,
        participantsSnapshots: [],
      );

      return dto;
    }).toList();

    return dtos;
  }
}
