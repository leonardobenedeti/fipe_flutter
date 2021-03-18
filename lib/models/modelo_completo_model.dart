class ModeloModel {
  String valor;
  String marca;
  String modelo;
  int anoModelo;
  String combustivel;
  String codigoFipe;
  String mesReferencia;
  String autenticacao;
  int tipoVeiculo;
  String siglaCombustivel;
  String dataConsulta;

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
}
