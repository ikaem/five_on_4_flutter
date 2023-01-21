import 'dart:io';

import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart' show AppPaths;
import 'package:isar/isar.dart';

class AppDatabase {
  AppDatabase({
    required this.appPaths,
  });

  final AppPaths appPaths;

  Isar? _db;

  Future<void> initialize() async {
    final Directory directory = await appPaths.applicationSupportDirectory;

    final Isar db = await Isar.open(
      [
        MatchLocalDTOSchema,
      ],
      directory: directory.path,
      // ignore: avoid_redundant_argument_values
      inspector: true,
    );

    _db = db;
  }

  Future<T> getItem<T>(int itemId) async {
    // TODO we will throw an error

    final Isar db = _validateDatabaseInitialized();

    final T? item = await db.collection<T>().get(itemId);
    if (item == null) throw const DatabaseNotFoundException();

    return item;
  }

  Future<List<T>> getAllItems<T>() async {
    final Isar db = _validateDatabaseInitialized();

    final List<T> items = await db.collection<T>().where().findAll();

    return items;
  }

  Future<int> insertItem<T>(T item) async {
    // TODO we will throw an error

    final Isar db = _validateDatabaseInitialized();

// TODO this should either add it all updated it - depending on wherther it already exists
    final int id = await db.collection<T>().put(item);
    // TODO we need some error handling for failed to insert too

    return id;
  }

  // TODO and now some database thing to make sure we have good data
  Isar _validateDatabaseInitialized() {
    final Isar? db = _db;

    if (db == null) throw const DatabaseNotInitializedException();

    return db;
  }
}
