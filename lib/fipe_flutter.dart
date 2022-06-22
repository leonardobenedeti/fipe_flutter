library fipe_flutter;

import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:fipe_flutter/models/marca_modelo_model.dart';
import 'package:fipe_flutter/models/modelo_completo_model.dart';

class FipeApi {
  late Dio client;

  static const basePath = 'veiculos.fipe.org.br';
  static const apiPath = "/api/veiculos";
  static const referenciaTabela = '266';

  FipeApi({Dio? client}) {
    this.client = client ?? Dio();
  }

  Future<List<MarcaModeloModel>> consultarMarcas({
    required String tipoVeiculo,
    Options? options,
  }) async {
    const marcasApi = '/ConsultarMarcas';

    var response = await client.postUri(
      Uri.https(basePath, apiPath + marcasApi),
      data: {
        'codigoTabelaReferencia': referenciaTabela,
        'codigoTipoVeiculo': tipoVeiculo,
      },
    );
    if (response.statusCode != 200)
      return throw '[ConsultarMarcas] Algo de errado não está certo';

    List marcas = response.data;
    return marcas.map((marca) => MarcaModeloModel.fromJson(marca)).toList();
  }

  Future<List<MarcaModeloModel>> consultarModelos({
    required String tipoVeiculo,
    required String codigoMarca,
    Options? options,
  }) async {
    final veiculosApi = '/ConsultarModelos';
    var response = await client.postUri(
      Uri.https(basePath, apiPath + veiculosApi),
      data: {
        'codigoTipoVeiculo': tipoVeiculo,
        'codigoTabelaReferencia': referenciaTabela,
        'codigoMarca': codigoMarca,
      },
    );
    if (response.statusCode != 200)
      return throw '[ConsultarModelos] Algo de errado não está certo';

    List veiculos = response.data['Modelos'];
    return veiculos.map((v) => MarcaModeloModel.fromJson(v)).toList();
  }

  Future<List<MarcaModeloModel>> consultarAnoModelo({
    required String tipoVeiculo,
    required String codigoMarca,
    required String codigoModelo,
    Options? options,
  }) async {
    final anoModeloApi = '/ConsultarAnoModelo';
    var response = await client.postUri(
      Uri.https(basePath, apiPath + anoModeloApi),
      data: {
        'codigoTipoVeiculo': tipoVeiculo,
        'codigoTabelaReferencia': referenciaTabela,
        'codigoModelo': codigoModelo,
        'codigoMarca': codigoMarca,
      },
    );
    if (response.statusCode != 200)
      return throw '[ConsultarAnoModelo] Algo de errado não está certo';

    List veiculos = response.data;
    return veiculos.map((v) => MarcaModeloModel.fromJson(v)).toList();
  }

  Future<List<MarcaModeloModel>> consultarModelosAtravesDoAno({
    required String tipoVeiculo,
    required String codigoMarca,
    required String codigoModelo,
    required String ano,
    required String codigoTipoCombustivel,
    required String anoModelo,
    Options? options,
  }) async {
    final anoModeloApi = '/ConsultarModelosAtravesDoAno';
    var response = await client.postUri(
      Uri.https(basePath, apiPath + anoModeloApi),
      data: {
        'codigoTipoVeiculo': tipoVeiculo,
        'codigoTabelaReferencia': referenciaTabela,
        'codigoModelo': codigoModelo,
        'codigoMarca': codigoMarca,
        'ano': ano,
        'codigoTipoCombustivel': codigoTipoCombustivel,
        'anoModelo': anoModelo,
      },
    );
    if (response.statusCode != 200)
      return throw '[ConsultarModelosAtravesDoAno] Algo de errado não está certo';

    List veiculos = response.data;
    return veiculos.map((v) => MarcaModeloModel.fromJson(v)).toList();
  }

  Future<ModeloModel> consultarValorComTodosParametros({
    required String tipoVeiculo,
    required String codigoMarca,
    required String codigoModelo,
    required String codigoTipoCombustivel,
    required String anoModelo,
    Options? options,
  }) async {
    final valorComParametrosApi = '/ConsultarValorComTodosParametros';
    var response = await client.postUri(
      Uri.https(basePath, apiPath + valorComParametrosApi),
      data: {
        'codigoTabelaReferencia': referenciaTabela,
        'codigoMarca': codigoMarca,
        'codigoModelo': codigoModelo,
        'codigoTipoVeiculo': tipoVeiculo,
        'anoModelo': anoModelo,
        'codigoTipoCombustivel': codigoTipoCombustivel,
        'tipoConsulta': 'tradicional',
      },
    );
    if (response.statusCode != 200)
      return throw '[ConsultarModelosAtravesDoAno] Algo de errado não está certo';

    final jsonBody = response.data;
    return ModeloModel.fromJson(jsonBody);
  }
}
