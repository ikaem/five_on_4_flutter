import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';
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
