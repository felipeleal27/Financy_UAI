class Categoria {
  int id;
  String nome;
  String descricao;

  Categoria({
    required this.id,
    required this.nome,
    required this.descricao,
  });

  Categoria copyWith({
    int? id,
    String? nome,
    String? descricao,
  }) {
    return Categoria(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
    );
  }
}