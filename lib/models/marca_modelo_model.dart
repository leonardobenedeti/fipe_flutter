class MarcaModeloModel {
  String? value;
  String? label;

  MarcaModeloModel({
    this.value,
    this.label,
  });

  factory MarcaModeloModel.fromJson(Map<String, dynamic> json) =>
      MarcaModeloModel(
        value: '${json['Value']}',
        label: json['Label'],
      );
}
