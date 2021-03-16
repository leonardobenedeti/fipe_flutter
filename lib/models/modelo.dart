class ModeloModel {
  String fipeMarca;
  String fipeCodigo;
  String name;
  String marca;
  String key;
  String veiculo;
  String id;

  ModeloModel({
    this.fipeMarca,
    this.fipeCodigo,
    this.name,
    this.marca,
    this.key,
    this.veiculo,
    this.id,
  });

  factory ModeloModel.fromJson(Map<String, dynamic> json) => ModeloModel(
        fipeMarca: json['fipe_marca'],
        fipeCodigo: json['fipe_codigo'],
        name: json['name'],
        marca: json['marca'],
        key: json['key'],
        veiculo: json['veiculo'],
        id: json['id'],
      );
}
