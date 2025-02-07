import 'dart:io';

import 'package:gestao_financeira/app/utils/util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  DB._();

  static const _dbaseVersion = 1;
  static const _dbaseName = 'financy.db';

  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initdatabase();
  }
  
  _initdatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    if (Platform.isWindows) {
      databaseFactoryOrNull = null;
      // // Initialize FFI
      // sqfliteFfiInit();
      // databaseFactory = databaseFactoryFfi;
      documentsDirectory = await getApplicationSupportDirectory();
    }

    return await openDatabase(
      "${documentsDirectory.path}/$_dbaseName",
      version: _dbaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_tabelaUsuario);
    await db.execute(_tabelaCategoria);
    await db.execute(_tabelaMovimentacao);
  }

  _onUpgrade(db, oldVersion, newVersion) async {
    _onCreate(db, newVersion);

    //await addColumnIfNotExists(db, "resumo", "conjunto", "INTEGER");
  }

  Future<void> addColumnIfNotExists(
      Database db, String table, String column, String type) async {
    if (!await db.isColumnExists(table, column)) {
      await db.execute("ALTER TABLE $table ADD COLUMN $column $type");
    }
  }
  
  Future<void> apagarBanco() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    if (Platform.isWindows) {
      documentsDirectory = await getApplicationSupportDirectory();
    }
    String path = "${documentsDirectory.path}/$_dbaseName";

    if (await File(path).exists()) {
      await deleteDatabase(path);

      if (await File(path).exists()) {
        await File(path).delete();
      }
      await openDatabase(path,
          version: _dbaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
    }
  }

  //Tabelas

  final String _tabelaUsuario = '''
    CREATE TABLE IF NOT EXISTS usuario (
      Id INTEGER PRIMARY KEY AUTOINCREMENT,
      Nome TEXT NOT NULL,
      Email TEXT NOT NULL,
      Senha TEXT NOT NULL
  )''';

  final String _tabelaMovimentacao = '''
    CREATE TABLE IF NOT EXISTS movimentacao (
      Id INTEGER PRIMARY KEY AUTOINCREMENT,
      Nome TEXT NOT NULL,
      Valor REAL NOT NULL,
      IdCategoria INTEGER NOT NULL,
      IsSaida INTEGER NOT NULL,
      DataMovimentacao INTERGER NOT NULL,
      Descricao TEXT,
      IdUsuario INTEGER NOT NULL,
      FOREIGN KEY (IdCategoria) REFERENCES categoria (Id),
      FOREIGN KEY (IdUsuario) REFERENCES usuario (id)
  )''';

  final String _tabelaCategoria = '''
    CREATE TABLE IF NOT EXISTS categoria (
      Id INTEGER PRIMARY KEY AUTOINCREMENT,
      Nome TEXT NOT NULL,
      IdUsuario INTEGER NOT NULL,
      FOREIGN KEY (IdUsuario) REFERENCES usuario (id)
  )''';
}
