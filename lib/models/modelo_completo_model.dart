class ModeloModel {
  String? valor;
  String? marca;
  String? modelo;
  int? anoModelo;
  String? combustivel;
  String? codigoFipe;
  String? mesReferencia;
  String? autenticacao;
  int? tipoVeiculo;
  String? siglaCombustivel;
  String? dataConsulta;

  ModeloModel({
    this.valor,
    this.marca,
    this.modelo,
    this.anoModelo,
    this.combustivel,
    this.codigoFipe,
    this.mesReferencia,
    this.autenticacao,
    this.tipoVeiculo,
    this.siglaCombustivel,
    this.dataConsulta,
  });

  factory ModeloModel.fromJson(Map<String, dynamic> json) => ModeloModel(
        valor: json['Valor'],
        marca: json['Marca'],
        modelo: json['Modelo'],
        anoModelo: json['AnoModelo'],
        combustivel: json['Combustivel'],
        codigoFipe: json['CodigoFipe'],
        mesReferencia: json['MesReferencia'],
        autenticacao: json['Autenticacao'],
        tipoVeiculo: json['TipoVeiculo'],
        siglaCombustivel: json['SiglaCombustivel'],
        dataConsulta: json['DataConsulta'],
      );

  toMap() {
    var map = new Map<String, dynamic>();
    map['Valor'] = this.valor;
    map['Marca'] = this.marca;
    map['Modelo'] = this.modelo;
    map['AnoModelo'] = this.anoModelo;
    map['Combustivel'] = this.combustivel;
    map['CodigoFipe'] = this.codigoFipe;
    map['MesReferencia'] = this.mesReferencia;
    map['Autenticacao'] = this.autenticacao;
    map['TipoVeiculo'] = this.tipoVeiculo;
    map['SiglaCombustivel'] = this.siglaCombustivel;
    map['DataConsulta'] = this.dataConsulta;
    return map;
  }
}
