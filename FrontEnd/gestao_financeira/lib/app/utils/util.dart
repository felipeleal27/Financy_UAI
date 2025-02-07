import 'package:sqflite/sqflite.dart';

extension MyIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}

extension FrotaDatabase on Database {
  Future<bool> isColumnExists(String table, String column) async {
    bool isExists = false;
    List<Map> cursor = await rawQuery("PRAGMA table_info($table)", null);
    for (var element in cursor) {
      String name = element["name"];
      if (name.toUpperCase() == column.toUpperCase()) {
        isExists = true;
      }
    }
    return isExists;
  }
}
