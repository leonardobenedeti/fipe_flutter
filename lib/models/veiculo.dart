class VeiculoModel {
  String fipeMarca;
  String name;
  String marca;
  String key;
  String id;
  String fipeName;

  VeiculoModel({
    this.fipeMarca,
    this.name,
    this.marca,
    this.key,
    this.id,
    this.fipeName,
  });

  factory VeiculoModel.fromJson(Map<String, dynamic> json) => VeiculoModel(
        fipeMarca: json['fipe_marca'],
        name: json['name'],
        marca: json['marca'],
        key: json['key'],
        id: json['id'],
        fipeName: json['fipe_name'],
      );
}
