import 'package:sqflite/sqflite.dart';

class CommandSql {
  late Database db;

  CommandSql(dbSql) {
    db = dbSql;
  }

  Future<List<Map<String, dynamic>>> select(String table,
      {String? where, List<dynamic>? whereArgs}) async {
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  Future<Map<String, dynamic>?> selectFirst(String table,
      {String? where, List<dynamic>? whereArgs}) async {
    var result = await db.query(table, where: where, whereArgs: whereArgs);
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<int> insert(String table, Map<String, dynamic> values) async {
    return await db.insert(table, values);
  }

  Future<int> update(String table, Map<String, dynamic> values,
      {String? where, List<dynamic>? whereArgs}) async {
    return await db.update(table, values,
        where: where,
        whereArgs: whereArgs,
        conflictAlgorithm: ConflictAlgorithm.fail);
  }

  Future<int> delete(String table,
      {String? where, List<dynamic>? whereArgs}) async {
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  Future<List<Map<String, dynamic>>> rawQuery(String sql,
      [List<dynamic>? arguments]) async {
    return await db.rawQuery(sql, arguments);
  }

  Future<int> rawInsert(String sql, [List<dynamic>? arguments]) async {
    return await db.rawInsert(sql, arguments);
  }

  Future<int> rawUpdate(String sql, [List<dynamic>? arguments]) async {
    return await db.rawUpdate(sql, arguments);
  }

  Future<int> rawDelete(String sql, [List<dynamic>? arguments]) async {
    return await db.rawDelete(sql, arguments);
  }

  Future<void> sincronizar(dados) async {
    // for (var dado in Sincronizar.values) {
    //   await CommandSql(db).delete(dado.toString().split('.').last);
    // }

    //insert dados
    for (var element in dados.armazem) {
      await CommandSql(db).insert('usuario', element.toMap());
    }

    for (var element in dados.peneiras) {
      await CommandSql(db).insert('movimentacao', element.toMap());
    }

    for (var element in dados.balanca) {
      await CommandSql(db).insert('categoria', element.toMap());
    }
    
  }

  Future<void> reset() async {
    // for (var dado in Sincronizar.values) {
    //   await CommandSql(db).delete(dado.toString().split('.').last);
    // }

    //delete movimentos
    await CommandSql(db).delete('usuario');
    await CommandSql(db).delete('movimentacao');
    await CommandSql(db).delete('categoria');
  }
}
