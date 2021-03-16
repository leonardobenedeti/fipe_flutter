class MarcaModel {
  String name;
  String fipeName;
  int order;
  String key;
  int id;

  MarcaModel({
    this.name,
    this.fipeName,
    this.order,
    this.key,
    this.id,
  });

  factory MarcaModel.fromJson(Map<String, dynamic> json) => MarcaModel(
        name: json['name'],
        fipeName: json['fipe_name'],
        order: json['order'],
        key: json['key'],
        id: json['id'],
      );
}
