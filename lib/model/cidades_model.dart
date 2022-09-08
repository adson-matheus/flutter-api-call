class Cidade {
  final String nome;
  final String codigoIbge;

  Cidade(this.nome, this.codigoIbge);

  factory Cidade.fromJson(Map json) {
    return Cidade(json["nome"], json["codigo_ibge"]);
  }

  @override
  String toString() {
    return '$codigoIbge - $nome';
  }
}
