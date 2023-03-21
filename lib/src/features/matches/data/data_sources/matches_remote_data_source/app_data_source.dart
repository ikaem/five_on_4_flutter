import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_join/match_join.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/args/match_participants_invitations/args.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/exceptions/match_participants_exceptions.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_4_flutter/src/libraries/firebase/firebase.dart';

class MatchesRemoteAppDataSource implements MatchesRemoteDataSource {
  static const String firestoreMatchesCollection = 'matches';
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
      collectionName: firestoreMatchesCollection,
      itemId: id,
    );

    final Map<String, dynamic>? matchData = matchResponse.data();
    // TODO create better exception for this
    // TODO this should be thrown by firestroe - so when we get the data here, this should be correct 100%
    if (matchData == null) throw 'No such match exception';

    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        matchParticipantsResponse =
        await _firestoreWrapper.getSubcollectionItems(
      collectionName: firestoreMatchesCollection,
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
            collectionPath: firestoreMatchesCollection);

    final List<MatchRemoteDTO> dtos =
        _generateMatchDTOsFromFirestoreResponse(response);

    return dtos;
  }

  @override
  Future<String> createMatch(NewMatchValue newMatch) async {
    final Map<String, dynamic> matchData = {
      'name': newMatch.name,
    };

    final String matchId = await _firestoreWrapper.insertCollectionItem(
      collectionName: firestoreMatchesCollection,
      collectionItem: matchData,
    );

    return matchId;
  }

  @override
  Future<void> joinMatch(MatchJoinArgs args) async {
    // get player

    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        matchParticipantsSnapshots =
        await _firestoreWrapper.getSubcollectionItems(
      collectionName: firestoreMatchesCollection,
      itemId: args.matchId,
      subcollectionName: firestoreMatchPartipantsSubcollection,
    );

    final List<MatchParticipantRemoteDTO> matchParticipantsDTOs =
        matchParticipantsSnapshots
            .map((p) => MatchParticipantRemoteDTO.fromFirestoreSnapshot(
                matchId: args.matchId, snapshot: p))
            .toList();

    final bool isPlayerAlreadyJoined =
        matchParticipantsDTOs.any((p) => p.userId == args.playerId);

    if (isPlayerAlreadyJoined)
      throw MatchParticipantsPlayerAlreadyJoinedException(
          message:
              'Player ${args.playerId} has already joined match ${args.matchId}');

    // ok, now we know that the player has not joined

    final Map<String, dynamic> participantData = {
      'nickname': args.playerNickname,
      'playerId': args.playerId,
    };

// TODO not sure if i need id

    await _firestoreWrapper.insertSubcollectionItem(
      collectionName: firestoreMatchesCollection,
      parentItemId: args.matchId,
      subcollectionName: firestoreMatchPartipantsSubcollection,
      subcollectionItem: participantData,
    );

    // check if this player has already joined

    // final Map<String, dynamic> participantData = {
    //   "nickname": args.
    // }

    // create data

    // add value to participants subcollection
  }

  @override
  Future<void> unjoinMatch(MatchJoinArgs args) async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        matchParticipantsSnapshots =
        await _firestoreWrapper.getSubcollectionItems(
      collectionName: firestoreMatchesCollection,
      itemId: args.matchId,
      subcollectionName: firestoreMatchPartipantsSubcollection,
    );

    final List<MatchParticipantRemoteDTO> matchParticipantsDTOs =
        matchParticipantsSnapshots
            .map((p) => MatchParticipantRemoteDTO.fromFirestoreSnapshot(
                matchId: args.matchId, snapshot: p))
            .toList();

    final bool isPlayerJoined =
        matchParticipantsDTOs.any((p) => p.userId == args.playerId);

    if (!isPlayerJoined) {
      throw MatchParticipantsPlayerAlreadyUnjoinedException(
          message:
              'Player ${args.playerId} has already joined match ${args.matchId}');
    }

    await _firestoreWrapper.removeSubcollectionItemWhereEqual(
      collectionName: firestoreMatchesCollection,
      parentItemId: args.matchId,
      subcollectionName: firestoreMatchPartipantsSubcollection,
      whereField: 'playerId',
      value: args.playerId,
    );
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

  @override
  Future<void> inviteToMatch(MatchParticipantsInvitationsArgs args) async {
    final List<MatchParticipantInviteArgs> participantsInvitations =
        args.participantsArgs;
    final String matchId = args.matchId;

    try {
      await _firestoreWrapper.performingBatchWriteOperation((batchSet) async {
        for (final MatchParticipantInviteArgs participantInvite
            in participantsInvitations) {
          final Map<String, dynamic> invitationData =
              participantInvite.toInvitationMap();

          final DocumentReference<Map<String, dynamic>> inviteReference =
              await _firestoreWrapper.insertSubcollectionItem(
            collectionName: firestoreMatchesCollection,
            parentItemId: matchId,
            subcollectionName: firestoreMatchPartipantsSubcollection,
            subcollectionItem: invitationData,
          );

          batchSet(inviteReference, invitationData);
        }
      });
    } catch (e) {
      log('There was an error with inviting players to a match: players: ${participantsInvitations}, match: ${matchId}, error: ${e.toString()}');

      // examine and throw a better error here;
      rethrow;
    }
  }

  @override
  Future<List<MatchRemoteDTO>> getInvitedMatches(String playerId) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestoreWrapper.db
            .collectionGroup('match_participants')
            .where('playerId', isEqualTo: playerId)
            .where('status', isEqualTo: 'invited')
            .get();

    final Iterable<Future<DocumentSnapshot<Map<String, dynamic>>>>
        futureMatches = querySnapshot.docs.map(
      (participantDoc) async {
        final DocumentReference<Map<String, dynamic>>? matchReference =
            participantDoc.reference.parent.parent;

        final matchDocSnapshot = await matchReference!.get();

        return matchDocSnapshot;

        // TODO remove
      },
    );

    final List<DocumentSnapshot<Map<String, dynamic>>> matchesDocSnapshots =
        await Future.wait(futureMatches);

    final List<MatchRemoteDTO> matches = matchesDocSnapshots
        .map((s) => MatchRemoteDTO.fromFirestoreSnapshots(
            matchSnapshot: s, participantsSnapshots: []))
        .toList();

    return matches;

    // TODO: implement getInvitedMatches
    // await _firestoreWrapper.getInvitedMatches(playerId);
  }

  @override
  Future<MatchRemoteDTO> getPlayerNextMatch(String playerId) async {
    // final QuerySnapshot<Map<String, dynamic>> collectionQuerySnapshot =
    //     await _firestoreWrapper.db.collection(firestoreMatchesCollection).get();

    // final List<QueryDocumentSnapshot<Map<String, dynamic>>>
    //     queryDocumentSnapshots = collectionQuerySnapshot.docs;

    final CollectionReference<Map<String, dynamic>> collection =
        _firestoreWrapper.db.collection(firestoreMatchesCollection);

    // final QuerySnapshot<Map<String, dynamic>> matchQuerySnapshot  = await collection.get();
    final QuerySnapshot<Map<String, dynamic>> matchQuerySnapshot =
        await collection.limit(1).get();

    final QueryDocumentSnapshot<Map<String, dynamic>> document =
        matchQuerySnapshot.docs.first;

    // getting participants
    final QuerySnapshot<Map<String, dynamic>> participantsQuerySnapshot =
        await _firestoreWrapper.db
            .collection(firestoreMatchesCollection)
            .doc(document.id)
            .collection(firestoreMatchPartipantsSubcollection)
            .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> participantsItems =
        participantsQuerySnapshot.docs;

// TODO it is important that single document is of different type that multple

    final MatchRemoteDTO matchRemoteDTO = MatchRemoteDTO.fromFirestoreSnapshots(
      matchSnapshot: document,
      participantsSnapshots: participantsItems,
    );

    return matchRemoteDTO;
  }
}
