import 'package:flutter/foundation.dart';
import 'package:gestao_financeira/app/data/model/movimentacao_model.dart';
import 'package:gestao_financeira/app/database/local_storage/local_storage.dart';
import 'package:gestao_financeira/app/database/sqllite/db.dart';
import 'package:gestao_financeira/app/database/sqllite/sql_lite.dart';
import 'package:gestao_financeira/app/repository/home_repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  // final RestClient _restClient;
  final LocalStorage _localStorage;

  HomeRepositoryImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  Future<bool> novaMovimentacao(MovimentacaoModel movimentacao) async {
    try {
      final db = await DB.instance.database;
      final query = CommandSql(db);
      await query.insert('movimentacao', movimentacao.toMap());
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  @override
  Future<bool> removerMovimentacao(MovimentacaoModel movimentacao) async {
    try {
      final db = await DB.instance.database;
      final query = CommandSql(db);
      await query.delete('movimentacao',
          where: 'Id = ?', whereArgs: [movimentacao.id]);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  @override
  Future<List<MovimentacaoModel>> getMovimentacoes() async {
    try {
      final db = await DB.instance.database;
      final query = CommandSql(db);
      final result = await query.select('movimentacao');
      return result
          .map((e) => MovimentacaoModel.fromMap(e, sqlLite: true))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<double> setSaldo(MovimentacaoModel mov, bool removendo) async {
    try {
      var saldoAtual = await _localStorage.read<String>('saldo');
      double? saldoDouble = double.tryParse(saldoAtual ?? '0');
      if (removendo) {
        saldoDouble = (saldoDouble ?? 0) - mov.valor;
        _localStorage.write('saldo', saldoDouble.toString());
        return saldoDouble;
      } else {
        saldoDouble = (saldoDouble ?? 0) + mov.valor;
        _localStorage.write('saldo', saldoDouble.toString());
        return saldoDouble;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return 0.0;
    }
  }

  @override
Future<List<MovimentacaoModel>> getMovimentacoesDoMes(int mes) async {
  try {
    final db = await DB.instance.database;
    final query = CommandSql(db);

    final now = DateTime.now();
    final ano = now.year;

    final primeiroDia = DateTime(ano, mes, 1).millisecondsSinceEpoch;
    final ultimoDia = DateTime(ano, mes + 1, 0, 23, 59, 59).millisecondsSinceEpoch;

    final result = await query.rawQuery(
      '''
      SELECT * FROM movimentacao
      WHERE DataMovimentacao BETWEEN ? AND ?
      ''',
      [primeiroDia, ultimoDia]
    );

    return result.map((e) => MovimentacaoModel.fromMap(e, sqlLite: true)).toList();
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return [];
  }
}

}
