import 'dart:convert';

import 'package:gestao_financeira/app/data/dtos/categoria.dart';

class CategoriaModel extends Categoria {
  CategoriaModel({
    required super.id,
    required super.nome,
    required super.descricao,
  });

  @override
  String toString() => nome;

  get value => super.nome;

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Nome': nome,
      'Descricao': descricao,
    };
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map, {bool sqlLite = false}) {
    return CategoriaModel(
      id: map['Id'],
      nome: map['Nome'],
      descricao: map['Descricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaModel.fromJson(String source) => CategoriaModel.fromMap(json.decode(source));
}