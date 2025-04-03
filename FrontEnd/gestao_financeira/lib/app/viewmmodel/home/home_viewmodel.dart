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
        _homeRepository = homeRepository {
    mesAtual = DateTime.now().month - 1;
  }

  @observable
  bool carregado = false;

  @observable
  bool carregouMes = false;

  @observable
  int currentIndex = 0;

  @observable
  bool canSeeValue = true;

  @observable
  bool isDark = false;

  @action
  Future<void> getTheme() async {
    isDark = await _localStorage.isThemeDark();
  }

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
  Future<void> mudarMes(int direcao) async {
    mesAtual = (mesAtual + direcao) % 12;
    if (mesAtual < 0) mesAtual = 11;
    await buscarMovimentacoesDoMes();
  }

  //Dados do usuário
  @observable
  double saldo = 0.00;

  @action
  String formatarMoeda(double valor) =>
      NumberFormat.currency(locale: 'pt_BR', symbol: '').format(valor);

  @action
  Future<void> atualizarSaldo(MovimentacaoModel mov, bool removendo) async {
    if (mov.dataMovimentacao.year == DateTime.now().year &&
        mov.dataMovimentacao.month == DateTime.now().month) {
      await setSaldo(await _homeRepository.setSaldo(mov, removendo));
    }
  }

  @action
  Future<void> setSaldo(double value) async {
    saldo = value;
  }

  //Dados Movimentações
  ObservableList<MovimentacaoModel> movimentacoesDoMes = ObservableList.of([]);

  @action
  void addMovimentacao(MovimentacaoModel? movimentacao) {
    if (movimentacao != null) {
      movimentacoesDoMes.add(movimentacao);
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
    categoria.clear();
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

    for (var movimentacao in movimentacoesDoMes) {
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
  Future<void> removerMovimentacao(MovimentacaoModel movimentacao) async {
    movimentacoesDoMes.remove(movimentacao);
    await _homeRepository.removerMovimentacao(movimentacao);
    // calcularSaldoPrevisto(true);
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
  Future<void> buscarMovimentacoesDoMes() async {
    carregouMes = false;
    movimentacoesDoMes.clear();
    movimentacoesDoMes.addAll(await _homeRepository.getMovimentacoesDoMes(mesAtual + 1));
    carregouMes = true;
  }

  Future<void> buscarDadosIniciais() async {
    carregado = false;
    await setSaldo(double.tryParse(await _localStorage.read('saldo')) ?? 0.0);
    await buscarMovimentacoesDoMes();
    await getTheme();
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

  // @action
  // void calcularSaldoPrevisto(bool removendo) {
  //   double valorDoMes = 0;
  //   saldoPrevisto = saldo;
  //   for (var movimento in movimentacoesDoMes) {
  //     if (removendo) {
  //       valorDoMes -= movimento.valor;
  //     } else {
  //       valorDoMes += movimento.valor;
  //     }
  //   }
  //   saldoPrevisto += valorDoMes;
  // }

  @computed
  bool get isMesAtual {
    final now = DateTime.now();
    return mesAtual == now.month - 1;
  }
}
