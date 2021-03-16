class ModeloModel {
  String referencia;
  String fipeCodigo;
  String name;
  String combustivel;
  String marca;
  String anoModelo;
  String preco;
  String key;
  double time;
  String veiculo;
  String id;

  ModeloModel({
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

  factory ModeloModel.fromJson(Map<String, dynamic> json) => ModeloModel(
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
