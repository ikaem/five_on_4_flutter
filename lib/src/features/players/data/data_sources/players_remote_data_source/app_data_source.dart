import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';
import 'package:five_on_4_flutter/src/features/players/presentation/blocs/players_get/bloc.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart';

class PlayersRemoteAppDataSource implements PlayersRemoteDataSource {
  static const String firestorePlayersCollection = 'players';
  static const String firestorePlayerAuthIdField = 'authId';

  const PlayersRemoteAppDataSource({
    required FirestoreWrapper firestoreWrapper,
  }) : _firestoreWrapper = firestoreWrapper;

  final FirestoreWrapper _firestoreWrapper;

  Future<PlayerRemoteDTO> getPlayer(String id) async {
    final DocumentSnapshot<Map<String, dynamic>> response =
        await _firestoreWrapper.getCollectionItem(
      collectionName: firestorePlayersCollection,
      itemId: id,
    );

    final PlayerRemoteDTO playerRemoteDTO =
        PlayerRemoteDTO.fromFirestoreSnapshot(response);

    return playerRemoteDTO;
  }

  Future<List<PlayerRemoteDTO>> getPlayers() async {
    throw UnimplementedError();
  }

  Future<String> createPlayer(PlayerArgs args) async {
    final Map<String, dynamic> data = {
      'authId': args.authId,
      'email': args.email,
      'nickname': args.nickname,
    };

    final String playerId = await _firestoreWrapper.insertCollectionItem(
      collectionName: firestorePlayersCollection,
      collectionItem: data,
    );

    return playerId;
  }

  // TODO should override this
  @override
  Future<List<PlayerRemoteDTO>> searchPlayers(
    PlayersGetSearchFilters filters,
    String? currentPlayerId,
  ) async {
    final String? searchTerm = filters.searchTerm;

    Query<Map<String, dynamic>> playersCollectionQuery =
        _firestoreWrapper.getCollectionQuery(
      collectionName: firestorePlayersCollection,
    );

    final bool shouldSkipSearch = searchTerm == null || searchTerm.isEmpty;

    if (shouldSkipSearch) return [];

    log('this is search term: ${filters.searchTerm}');

    playersCollectionQuery = playersCollectionQuery
        .where(
          'nickname',
          // arrayContainsAny: [searchTerm],
          // TODO later, implement better search with fuzzy and so on
          isEqualTo: searchTerm,
        )
        .where(FieldPath.documentId, isNotEqualTo: currentPlayerId);

    // playersCollectionQuery = playersCollectionQuery.where(
    //   'nickname',
    //   arrayContainsAny: [searchTerm],
    // );
    // .where(
    //   'email',
    //   arrayContainsAny: [searchTerm],
    // );

    final QuerySnapshot<Map<String, dynamic>> result =
        await playersCollectionQuery.get();

    final List<PlayerRemoteDTO> playerDTOs = result.docs
        .map((e) => PlayerRemoteDTO.fromFirestoreSnapshot(e))
        .toList();

    return playerDTOs;
  }

  // @override
  // Future<PlayerRemoteDTO> getPlayerByAuthId(String authId) async {
  //   final QueryDocumentSnapshot<Map<String, dynamic>> response =
  //       await _firestoreWrapper.getCollectionItemByFieldValue(
  //     collectionName: firestorePlayersCollection,
  //     fieldName: firestorePlayerAuthIdField,
  //     fieldValue: authId,
  //   );

  //   final PlayerRemoteDTO playerRemoteDTO =
  //       PlayerRemoteDTO.fromFirestoreSnapshot(response);

  //   return playerRemoteDTO;
  // }
}
