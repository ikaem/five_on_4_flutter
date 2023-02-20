import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/utils/extensions/map_extensions.dart';

class Firestore {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCollectionItems({
    required String collectionPath,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> collectionQuerySnapshot =
        await _db.collection(collectionPath).get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        queryDocumentSnapshots = collectionQuerySnapshot.docs;

    final List<Map<String, dynamic>> normalizedData =
        _queryDocumentSnapshotMapsToNormalizedData(queryDocumentSnapshots);

    return normalizedData;
  }

  List<Map<String, dynamic>> _queryDocumentSnapshotMapsToNormalizedData(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> maps) {
    final List<Map<String, dynamic>> normalizedDataMaps = maps.map((e) {
      final Map<String, dynamic> data = e.data();
      data.addKey('id', e.id);

      return data;
    }).toList();

    return normalizedDataMaps;
  }

  Future<String> postCollectionItem({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    final DocumentReference<Map<String, dynamic>> documentReference =
        await _db.collection(collectionPath).add(data);

    return documentReference.id;
  }
}
