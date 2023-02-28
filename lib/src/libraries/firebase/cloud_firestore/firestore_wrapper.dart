import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/domain/domain.dart';

typedef WriteBatchSet = void Function<T>(
  DocumentReference<T> document,
  T data, [
  SetOptions? options,
]);

class FirestoreWrapper {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> getCollectionDocumentReference({
    required String collectionName,
    required String? documentId,
  }) {
    final DocumentReference<Map<String, dynamic>> reference =
        _db.collection(collectionName).doc(documentId);

    return reference;
  }

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

  Future<DocumentSnapshot<Map<String, dynamic>>> getCollectionItem(
      {required String collectionName, required String itemId}) async {
    final DocumentSnapshot<Map<String, dynamic>> item =
        await _db.collection(collectionName).doc(itemId).get();

    _validateSnapshot(snapshot: item);

    return item;
  }

  // TODO move this down
  void _validateSnapshot({
    required DocumentSnapshot<Map<String, dynamic>> snapshot,
  }) {
    final Map<String, dynamic>? data = snapshot.data();

    if (data == null) throw HttpNotFoundException(message: 'Item not found');
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>>
      getCollectionItemByFieldValue({
    required String collectionName,
    required String fieldName,
    required String fieldValue,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> response = await _db
        .collection(collectionName)
        .where(fieldName, isEqualTo: fieldValue)
        .limit(1)
        .get();

    if (response.docs.isEmpty)
      throw HttpNotFoundException(
          message:
              'item with $fieldName of $fieldValue from $collectionName was not found');

    return response.docs.first;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getSubcollectionItems({
    required String collectionName,
    required String itemId,
    required String subcollectionName,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> subcollectionQuerySnapshot =
        await _db
            .collection(collectionName)
            .doc(itemId)
            .collection(subcollectionName)
            .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> subcollectionItems =
        subcollectionQuerySnapshot.docs;

    return subcollectionItems;
  }

  Future<String> insertSubcollectionItem({
    required String collectionName,
    required String parentItemId,
    required String subcollectionName,
    required Map<String, dynamic> subcollectionItem,
  }) async {
    final DocumentReference<Map<String, dynamic>> parentItemReference =
        _db.collection(collectionName).doc(parentItemId);

    final CollectionReference<Map<String, dynamic>> subcollectionReference =
        parentItemReference.collection(subcollectionName);

    final DocumentReference<Map<String, dynamic>> insertReference =
        await subcollectionReference.add(subcollectionItem);

    return insertReference.id;
  }

  Future<void> removeSubcollectionItemWhereEqual({
    required String collectionName,
    required String parentItemId,
    required String subcollectionName,
    required String whereField,
    required Object value,
  }) async {
    final DocumentReference<Map<String, dynamic>> parentItemReference =
        _db.collection(collectionName).doc(parentItemId);

    final CollectionReference<Map<String, dynamic>> subcollectionReference =
        parentItemReference.collection(subcollectionName);

    final QuerySnapshot<Map<String, dynamic>> itemsSnapshots =
        await subcollectionReference.where(whereField, isEqualTo: value).get();

    final DocumentReference<Map<String, dynamic>> itemReference =
        itemsSnapshots.docs.first.reference;

    await itemReference.delete();
  }

  Future<String> insertCollectionItem({
    required String collectionName,
    required Map<String, dynamic> collectionItem,
  }) async {
    final DocumentReference<Map<String, dynamic>> insertReference =
        await _db.collection(collectionName).add(collectionItem);

    return insertReference.id;
  }

  // List<Map<String, dynamic>> _queryDocumentSnapshotMapsToNormalizedData(
  //     List<QueryDocumentSnapshot<Map<String, dynamic>>> maps) {
  //   final List<Map<String, dynamic>> normalizedDataMaps = maps.map((e) {
  //     final Map<String, dynamic> data = e.data();
  //     data.addKey('id', e.id);

  //     return data;
  //   }).toList();

  //   return normalizedDataMaps;
  // }

  Future<String> postCollectionItem({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    final DocumentReference<Map<String, dynamic>> documentReference =
        await _db.collection(collectionPath).add(data);

    return documentReference.id;
  }

  Future<T> performingBatchWriteOperation<T>(
      Future<T> Function(WriteBatchSet batchSet) operation) async {
    final WriteBatch batch = _db.batch();

    // try {
    final T response = await operation(batch.set);
    await batch.commit();

    return response;
    // } catch (e) {
    //   log('There was an error performing batch write operation: $e');
    //   rethrow;
    // }
  }
}
