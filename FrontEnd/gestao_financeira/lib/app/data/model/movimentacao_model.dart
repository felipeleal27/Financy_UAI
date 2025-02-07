import 'dart:convert';

import 'package:gestao_financeira/app/data/dtos/movimentacao.dart';

class MovimentacaoModel extends Movimentacao {
  MovimentacaoModel({
    super.id,
    required super.nome,
    required super.valor,
    required super.idCategoria,
    required super.isSaida,
    required super.dataMovimentacao,
    required super.descricao,
    required super.idUsuario,
  });

  get value => super.valor;

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Nome': nome,
      'Valor': valor,
      'IdCategoria': idCategoria,
      'IsSaida': isSaida ? 1 : 0,
      'DataMovimentacao': dataMovimentacao.millisecondsSinceEpoch,
      'Descricao': descricao,
      'IdUsuario': idUsuario,
    };
  }

  factory MovimentacaoModel.fromMap(Map<String, dynamic> map, {bool sqlLite = false}) {
    return MovimentacaoModel(
      id: map['Id'] as int,
      nome: map['Nome'] as String,
      valor: map['Valor'] as double,
      idCategoria: map['IdCategoria'] as int,
      isSaida: sqlLite ?  map['IsSaida'] == 0 ? false : true : map['IsSaida'] as bool,
      dataMovimentacao: sqlLite
          ? DateTime.fromMillisecondsSinceEpoch(map['DataMovimentacao'] as int)
          : DateTime.parse(map['DataMovimentacao'] as String),
      descricao: map['Descricao'],
      idUsuario: map['IdUsuario'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovimentacaoModel.fromJsonString(String source) =>
      MovimentacaoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
