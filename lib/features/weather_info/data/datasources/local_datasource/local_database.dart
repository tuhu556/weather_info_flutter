import 'dart:io';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:weather_info_flutter/objectbox.g.dart';

class AppLocalDatabase {
  static Store? _store;

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<AppLocalDatabase> create() async {
    final Directory docsDir = await getApplicationDocumentsDirectory();
    _store = await openStore(
      directory: p.join(
        docsDir.path,
        'objectbox',
      ),
    );
    return AppLocalDatabase();
  }

  int? insert<T>(T object) {
    final Box<T>? box = _store?.box<T>();
    return box?.put(object);
  }

  Future<List<T>?> getAll<T>() async {
    final Box<T>? box = _store?.box<T>();
    return box?.getAll();
  }
}
