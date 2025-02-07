// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewmodel on HomeViewmodelBase, Store {
  Computed<Map<String, List<MovimentacaoModel>>>?
      _$movimentacoesPorDataComputed;

  @override
  Map<String, List<MovimentacaoModel>> get movimentacoesPorData =>
      (_$movimentacoesPorDataComputed ??=
              Computed<Map<String, List<MovimentacaoModel>>>(
                  () => super.movimentacoesPorData,
                  name: 'HomeViewmodelBase.movimentacoesPorData'))
          .value;

  late final _$carregadoAtom =
      Atom(name: 'HomeViewmodelBase.carregado', context: context);

  @override
  bool get carregado {
    _$carregadoAtom.reportRead();
    return super.carregado;
  }

  @override
  set carregado(bool value) {
    _$carregadoAtom.reportWrite(value, super.carregado, () {
      super.carregado = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: 'HomeViewmodelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$canSeeValueAtom =
      Atom(name: 'HomeViewmodelBase.canSeeValue', context: context);

  @override
  bool get canSeeValue {
    _$canSeeValueAtom.reportRead();
    return super.canSeeValue;
  }

  @override
  set canSeeValue(bool value) {
    _$canSeeValueAtom.reportWrite(value, super.canSeeValue, () {
      super.canSeeValue = value;
    });
  }

  late final _$mesAtualAtom =
      Atom(name: 'HomeViewmodelBase.mesAtual', context: context);

  @override
  int get mesAtual {
    _$mesAtualAtom.reportRead();
    return super.mesAtual;
  }

  @override
  set mesAtual(int value) {
    _$mesAtualAtom.reportWrite(value, super.mesAtual, () {
      super.mesAtual = value;
    });
  }

  late final _$saldoAtom =
      Atom(name: 'HomeViewmodelBase.saldo', context: context);

  @override
  double get saldo {
    _$saldoAtom.reportRead();
    return super.saldo;
  }

  @override
  set saldo(double value) {
    _$saldoAtom.reportWrite(value, super.saldo, () {
      super.saldo = value;
    });
  }

  late final _$nomeMovimentacaoAtom =
      Atom(name: 'HomeViewmodelBase.nomeMovimentacao', context: context);

  @override
  String get nomeMovimentacao {
    _$nomeMovimentacaoAtom.reportRead();
    return super.nomeMovimentacao;
  }

  @override
  set nomeMovimentacao(String value) {
    _$nomeMovimentacaoAtom.reportWrite(value, super.nomeMovimentacao, () {
      super.nomeMovimentacao = value;
    });
  }

  late final _$valorAtom =
      Atom(name: 'HomeViewmodelBase.valor', context: context);

  @override
  double get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(double value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  late final _$dataSelecionadaAtom =
      Atom(name: 'HomeViewmodelBase.dataSelecionada', context: context);

  @override
  DateTime get dataSelecionada {
    _$dataSelecionadaAtom.reportRead();
    return super.dataSelecionada;
  }

  @override
  set dataSelecionada(DateTime value) {
    _$dataSelecionadaAtom.reportWrite(value, super.dataSelecionada, () {
      super.dataSelecionada = value;
    });
  }

  late final _$isSaidaAtom =
      Atom(name: 'HomeViewmodelBase.isSaida', context: context);

  @override
  bool get isSaida {
    _$isSaidaAtom.reportRead();
    return super.isSaida;
  }

  @override
  set isSaida(bool value) {
    _$isSaidaAtom.reportWrite(value, super.isSaida, () {
      super.isSaida = value;
    });
  }

  late final _$categoriaSelecionadaAtom =
      Atom(name: 'HomeViewmodelBase.categoriaSelecionada', context: context);

  @override
  CategoriaModel? get categoriaSelecionada {
    _$categoriaSelecionadaAtom.reportRead();
    return super.categoriaSelecionada;
  }

  @override
  set categoriaSelecionada(CategoriaModel? value) {
    _$categoriaSelecionadaAtom.reportWrite(value, super.categoriaSelecionada,
        () {
      super.categoriaSelecionada = value;
    });
  }

  late final _$isSelectedDespesaAtom =
      Atom(name: 'HomeViewmodelBase.isSelectedDespesa', context: context);

  @override
  bool get isSelectedDespesa {
    _$isSelectedDespesaAtom.reportRead();
    return super.isSelectedDespesa;
  }

  @override
  set isSelectedDespesa(bool value) {
    _$isSelectedDespesaAtom.reportWrite(value, super.isSelectedDespesa, () {
      super.isSelectedDespesa = value;
    });
  }

  late final _$isSelectedReceitaAtom =
      Atom(name: 'HomeViewmodelBase.isSelectedReceita', context: context);

  @override
  bool get isSelectedReceita {
    _$isSelectedReceitaAtom.reportRead();
    return super.isSelectedReceita;
  }

  @override
  set isSelectedReceita(bool value) {
    _$isSelectedReceitaAtom.reportWrite(value, super.isSelectedReceita, () {
      super.isSelectedReceita = value;
    });
  }

  late final _$shouldOpenDialogAtom =
      Atom(name: 'HomeViewmodelBase.shouldOpenDialog', context: context);

  @override
  bool get shouldOpenDialog {
    _$shouldOpenDialogAtom.reportRead();
    return super.shouldOpenDialog;
  }

  @override
  set shouldOpenDialog(bool value) {
    _$shouldOpenDialogAtom.reportWrite(value, super.shouldOpenDialog, () {
      super.shouldOpenDialog = value;
    });
  }

  late final _$atualizarSaldoAsyncAction =
      AsyncAction('HomeViewmodelBase.atualizarSaldo', context: context);

  @override
  Future<void> atualizarSaldo(double value, bool removendo) {
    return _$atualizarSaldoAsyncAction
        .run(() => super.atualizarSaldo(value, removendo));
  }

  late final _$setSaldoAsyncAction =
      AsyncAction('HomeViewmodelBase.setSaldo', context: context);

  @override
  Future<void> setSaldo(double value) {
    return _$setSaldoAsyncAction.run(() => super.setSaldo(value));
  }

  late final _$buscarMovimentacoesAsyncAction =
      AsyncAction('HomeViewmodelBase.buscarMovimentacoes', context: context);

  @override
  Future<void> buscarMovimentacoes() {
    return _$buscarMovimentacoesAsyncAction
        .run(() => super.buscarMovimentacoes());
  }

  late final _$HomeViewmodelBaseActionController =
      ActionController(name: 'HomeViewmodelBase', context: context);

  @override
  void setCanSeeValue() {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.setCanSeeValue');
    try {
      return super.setCanSeeValue();
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mudarMes(int direcao) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.mudarMes');
    try {
      return super.mudarMes(direcao);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String formatarMoeda(double valor) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.formatarMoeda');
    try {
      return super.formatarMoeda(valor);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMovimentacao(MovimentacaoModel? movimentacao) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.addMovimentacao');
    try {
      return super.addMovimentacao(movimentacao);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNomeMovimentacao(String value) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.setNomeMovimentacao');
    try {
      return super.setNomeMovimentacao(value);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValor(double value) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.setValor');
    try {
      return super.setValor(value);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataSelecionada(DateTime data) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.setDataSelecionada');
    try {
      return super.setDataSelecionada(data);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSaida(bool value) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.setIsSaida');
    try {
      return super.setIsSaida(value);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategoria(CategoriaModel? value) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.setCategoria');
    try {
      return super.setCategoria(value);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarCategoriasBase() {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.adicionarCategoriasBase');
    try {
      return super.adicionarCategoriasBase();
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerMovimentacao(MovimentacaoModel movimentacao) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.removerMovimentacao');
    try {
      return super.removerMovimentacao(movimentacao);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectDespesa() {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.selectDespesa');
    try {
      return super.selectDespesa();
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectReceita() {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.selectReceita');
    try {
      return super.selectReceita();
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isDialogOpen(bool value) {
    final _$actionInfo = _$HomeViewmodelBaseActionController.startAction(
        name: 'HomeViewmodelBase.isDialogOpen');
    try {
      return super.isDialogOpen(value);
    } finally {
      _$HomeViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregado: ${carregado},
currentIndex: ${currentIndex},
canSeeValue: ${canSeeValue},
mesAtual: ${mesAtual},
saldo: ${saldo},
nomeMovimentacao: ${nomeMovimentacao},
valor: ${valor},
dataSelecionada: ${dataSelecionada},
isSaida: ${isSaida},
categoriaSelecionada: ${categoriaSelecionada},
isSelectedDespesa: ${isSelectedDespesa},
isSelectedReceita: ${isSelectedReceita},
shouldOpenDialog: ${shouldOpenDialog},
movimentacoesPorData: ${movimentacoesPorData}
    ''';
  }
}
