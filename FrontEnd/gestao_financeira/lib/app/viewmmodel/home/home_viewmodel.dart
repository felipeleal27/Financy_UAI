import 'package:flutter/foundation.dart';
import 'package:gestao_financeira/app/data/model/categoria_model.dart';
import 'package:gestao_financeira/app/data/model/movimentacao_model.dart';
import 'package:gestao_financeira/app/database/local_storage/local_storage.dart';
import 'package:gestao_financeira/app/repository/home_repository/home_repository.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'home_viewmodel.g.dart';

class HomeViewmodel = HomeViewmodelBase with _$HomeViewmodel;

abstract class HomeViewmodelBase with Store {
  final LocalStorage _localStorage;
  final HomeRepository _homeRepository;

  HomeViewmodelBase({
    required LocalStorage localStorage,
    required HomeRepository homeRepository,
  })  : _localStorage = localStorage,
        _homeRepository = homeRepository;

  @observable
  bool carregado = false;

  @observable
  int currentIndex = 0;

  @observable
  bool canSeeValue = true;

  @action
  void setCanSeeValue() => canSeeValue = !canSeeValue;

  @observable
  int mesAtual = DateTime.now().month - 1;

  final ObservableList<String> meses = ObservableList.of([
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ]);

  @action
  void mudarMes(int direcao) {
    mesAtual = (mesAtual + direcao) % 12;
    if (mesAtual < 0) mesAtual = 11;
  }

  //Dados do usuário
  @observable
  double saldo = 0.00;

  @action
  String formatarMoeda(double valor) =>
      NumberFormat.currency(locale: 'pt_BR', symbol: '').format(valor);

  @action
  Future<void> atualizarSaldo(double value, bool removendo) async {
    setSaldo(await _homeRepository.setSaldo(value, removendo));
  }

  @action
  Future<void> setSaldo(double value) async {
    saldo = value;
  }

  //Dados Movimentações
  ObservableList<MovimentacaoModel> movimentacoes = ObservableList.of([]);

  @action
  void addMovimentacao(MovimentacaoModel? movimentacao) {
    if (movimentacao != null) {
      movimentacoes.add(movimentacao);
    }
  }

  @observable
  String nomeMovimentacao = '';

  @action
  void setNomeMovimentacao(String value) => nomeMovimentacao = value;

  @observable
  double valor = 0.00;

  @action
  void setValor(double value) => valor = value;

  @observable
  DateTime dataSelecionada = DateTime.now();

  @action
  void setDataSelecionada(DateTime data) => dataSelecionada = data;

  @observable
  bool isSaida = false;

  @action
  void setIsSaida(bool value) => isSaida = value;

  ObservableList<CategoriaModel> categoria = ObservableList.of([]);

  @observable
  CategoriaModel? categoriaSelecionada;

  @action
  void setCategoria(CategoriaModel? value) => categoriaSelecionada = value;

  @action
  void adicionarCategoriasBase() {
    categoria.addAll([
      CategoriaModel(nome: 'Alimentação', id: 1, descricao: ''),
      CategoriaModel(nome: 'Transporte', id: 2, descricao: ''),
      CategoriaModel(nome: 'Lazer', id: 3, descricao: ''),
      CategoriaModel(nome: 'Educação', id: 4, descricao: ''),
      CategoriaModel(nome: 'Saúde', id: 5, descricao: ''),
      CategoriaModel(nome: 'Moradia', id: 6, descricao: ''),
      CategoriaModel(nome: 'Vestuário', id: 7, descricao: ''),
      CategoriaModel(nome: 'Comunicação', id: 8, descricao: ''),
      CategoriaModel(nome: 'Segurança', id: 9, descricao: ''),
      CategoriaModel(nome: 'Finanças', id: 10, descricao: ''),
    ]);
  }

  @computed
  Map<String, List<MovimentacaoModel>> get movimentacoesPorData {
    final Map<String, List<MovimentacaoModel>> agrupado = {};

    for (var movimentacao in movimentacoes) {
      final dataFormatada =
          DateFormat('dd/MM/yyyy').format(movimentacao.dataMovimentacao);

      if (!agrupado.containsKey(dataFormatada)) {
        agrupado[dataFormatada] = [];
      }
      agrupado[dataFormatada]!.add(movimentacao);
    }

    // Ordena o mapa por chave de data, da mais recente para a mais antiga
    final Map<String, List<MovimentacaoModel>> agrupadoOrdenado =
        Map.fromEntries(
      agrupado.entries.toList()
        ..sort((a, b) => DateFormat('dd/MM/yyyy')
            .parse(b.key)
            .compareTo(DateFormat('dd/MM/yyyy').parse(a.key))),
    );

    return agrupadoOrdenado;
  }

  @action
  void removerMovimentacao(MovimentacaoModel movimentacao) {
    movimentacoes.remove(movimentacao);
    _homeRepository.removerMovimentacao(movimentacao);
  }

  Future<bool> gravarMovimentacao(MovimentacaoModel movimentacao) async {
    try {
      await _homeRepository.novaMovimentacao(movimentacao);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  @action
  Future<void> buscarMovimentacoes() async {
    movimentacoes.clear();
    movimentacoes.addAll(await _homeRepository.getMovimentacoes());
  }

  Future<void> buscarDadosIniciais() async {
    carregado = false;
    await setSaldo(double.tryParse(await _localStorage.read('saldo')) ?? 0.0);
    await buscarMovimentacoes();
    adicionarCategoriasBase();
    carregado = true;
  }

  void limparDados() {
    nomeMovimentacao = '';
    valor = 0.0;
    categoriaSelecionada = null;
    isSaida = false;
    dataSelecionada = DateTime.now();
  }

  @observable
  bool isSelectedDespesa = true;

  @observable
  bool isSelectedReceita = false;

  @action
  void selectDespesa() {
    isSelectedDespesa = true;
    isSelectedReceita = false;
    isSaida = true;
  }

  @action
  void selectReceita() {
    isSelectedDespesa = false;
    isSelectedReceita = true;
    isSaida = false;
  }

  @observable
  bool shouldOpenDialog = false;

  @action
  void isDialogOpen(bool value) => shouldOpenDialog = value;
}
