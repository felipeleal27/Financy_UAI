import 'package:gestao_financeira/app/data/model/movimentacao_model.dart';

abstract class HomeRepository {
  Future<List<MovimentacaoModel>> getMovimentacoes();
  Future<bool> novaMovimentacao(MovimentacaoModel movimentacao);
  Future<bool> removerMovimentacao(MovimentacaoModel movimentacao);
  Future<double> setSaldo(MovimentacaoModel mov, bool removendo);
  Future<List<MovimentacaoModel>> getMovimentacoesDoMes(int mes);
}
