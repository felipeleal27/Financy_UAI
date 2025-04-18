import 'package:flutter/foundation.dart';
import 'package:gestao_financeira/app/database/local_storage/local_storage.dart';
import 'package:gestao_financeira/app/database/sqllite/db.dart';
import 'package:gestao_financeira/app/database/sqllite/sql_lite.dart';
import 'package:gestao_financeira/app/repository/splash_screen_repository/splash_screen_repository.dart';
import 'package:gestao_financeira/app/service/rest_client/exceptions/rest_client.dart';

class SplashScreenRepositoryImpl extends SplashScreenRepository {
  final LocalStorage _localStorage;

  SplashScreenRepositoryImpl({
    required RestClient restClient,
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  Future<bool> primeiroAcesso() async {
    return await _localStorage.isFirstAccess();
  }

  @override
Future<bool> calcularSaldoTotal() async {
  try {
    if (await primeiroAcesso()) {
      final db = await DB.instance.database;
      final query = CommandSql(db);

      // Obtém a data atual
      DateTime now = DateTime.now();
      DateTime primeiroDia = DateTime(now.year, now.month, 1);
      DateTime ultimoDia = DateTime(now.year, now.month + 1, 0);

      var saldo = await query.rawQuery('''
        SELECT SUM(valor) as saldo 
        FROM movimentacao
        WHERE dataMovimentacao BETWEEN ? AND ?
      ''', [primeiroDia.toIso8601String(), ultimoDia.toIso8601String()]);

      if (saldo.isNotEmpty) {
        await _localStorage.write('saldo', saldo.first['saldo'].toString());
        return true;
      } else {
        return false;
      }
    }
    return false;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

}
