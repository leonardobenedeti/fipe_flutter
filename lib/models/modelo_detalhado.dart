class ModeloDetalhadoModel {
  String referencia;
  String fipeCodigo;
  String name;
  String combustivel;
  String marca;
  String anoModelo;
  String preco;
  String key;
  int time;
  String veiculo;
  String id;

  ModeloDetalhadoModel({
    this.referencia,
    this.fipeCodigo,
    this.name,
    this.combustivel,
    this.marca,
    this.anoModelo,
    this.preco,
    this.key,
    this.time,
    this.veiculo,
    this.id,
  });

  factory ModeloDetalhadoModel.fromJson(Map<String, dynamic> json) =>
      ModeloDetalhadoModel(
        referencia: json['referencia'],
        fipeCodigo: json['fipe_codigo'],
        name: json['name'],
        combustivel: json['combustivel'],
        marca: json['marca'],
        anoModelo: json['ano_modelo'],
        preco: json['preco'],
        key: json['key'],
        time: json['time'],
        veiculo: json['veiculo'],
        id: json['id'],
      );
}
