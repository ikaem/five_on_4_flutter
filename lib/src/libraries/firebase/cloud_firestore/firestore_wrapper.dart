import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/utils/extensions/map_extensions.dart';

class FirestoreWrapper {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCollectionItems({
    required String collectionPath,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> collectionQuerySnapshot =
        await _db.collection(collectionPath).get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        queryDocumentSnapshots = collectionQuerySnapshot.docs;

    // final List<Map<String, dynamic>> normalizedData =
    //     _queryDocumentSnapshotMapsToNormalizedData(queryDocumentSnapshots);

    return queryDocumentSnapshots;
  }

  List<Map<String, dynamic>> _queryDocumentSnapshotMapsToNormalizedData(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> maps) {
    final List<Map<String, dynamic>> normalizedDataMaps = maps.map((e) {
      final Map<String, dynamic> data = e.data();
      data.addKey('id', e.id);

      return data;
    }).toList();

// TODO remove this id thing
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

  Future<void> getOneMatch() async {
    // final what =
    //     await _db.collection('matches').doc('km8LV81md4b17ylucGOg').get();

// TODO this is also a possibility - but maybe not flexible
    // await _db
    //     .collection('participants')
    //     .where('matchId', isEqualTo: 'km8LV81md4b17ylucGOg');

    // final what = await _db
    //     .collection('matches')
    //     .doc('km8LV81md4b17ylucGOg')
    //     .collection('match_participants')
    //     .get();
    // .get();

    final what = await _db
        .collection('participants')
        .where('matchId', isEqualTo: 'km8LV81md4b17ylucGOg')
        .get();

    // final test = what.data();

    final test = what.docs;

    final no = test.map((t) {
      final ready = t.data();

      return ready;
    }).toList();

    // log('this is test: $test');
    // log('this is docs - $test');

    // TODO test
  }
}
