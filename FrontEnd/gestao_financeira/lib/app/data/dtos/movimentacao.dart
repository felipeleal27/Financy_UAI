class Movimentacao {
  final int? id;
  final String nome;
  final double valor;
  final int idCategoria;
  final bool isSaida;
  final DateTime dataMovimentacao;
  final String descricao;
  final int idUsuario;

  Movimentacao({
    this.id,
    required this.nome,
    required this.valor,
    required this.idCategoria,
    required this.isSaida,
    required this.dataMovimentacao,
    required this.descricao,
    required this.idUsuario,
  });

  Movimentacao copyWith({
    int? id,
    String? nome,
    double? valor,
    int? idCategoria,
    bool? isSaida,
    DateTime? dataMovimentacao,
    String? descricao,
    int? idUsuario,
  }) {
    return Movimentacao(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      valor: valor ?? this.valor,
      idCategoria: idCategoria ?? this.idCategoria,
      isSaida: isSaida ?? this.isSaida,
      dataMovimentacao: dataMovimentacao ?? this.dataMovimentacao,
      descricao: descricao ?? this.descricao,
      idUsuario: idUsuario ?? this.idUsuario,
    );
  }
}
