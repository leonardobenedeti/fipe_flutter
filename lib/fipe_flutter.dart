library fipe_flutter;

import 'dart:convert' as convert;

import 'package:fipe_flutter/models/marca_modelo_model.dart';
import 'package:fipe_flutter/models/modelo_completo_model.dart';
import 'package:http/http.dart' as http;

class FipeApi {
  static const basePath = 'veiculos.fipe.org.br';
  static const apiPath = "/api/veiculos";
  static const referenciaTabela = '266';

  Future<List<MarcaModeloModel>> consultarMarcas(String tipoVeiculo) async {
    const marcasApi = '/ConsultarMarcas';

    var response = await http.post(
      Uri.https(basePath, apiPath + marcasApi),
      body: {
        'codigoTabelaReferencia': referenciaTabela,
        'codigoTipoVeiculo': tipoVeiculo,
      },
    );
    if (response.statusCode != 200)
      return throw '[ConsultarMarcas] Algo de errado não está certo';

    List marcas = convert.jsonDecode(response.body);
    return marcas.map((marca) => MarcaModeloModel.fromJson(marca)).toList();
  }

  Future<List<MarcaModeloModel>> consultarModelos(
    String tipoVeiculo,
    String codigoMarca,
  ) async {
    final veiculosApi = '/ConsultarModelos';
    var response = await http.post(
      Uri.https(basePath, apiPath + veiculosApi),
      body: {
        'codigoTipoVeiculo': tipoVeiculo,
        'codigoTabelaReferencia': referenciaTabela,
        'codigoMarca': codigoMarca,
      },
    );
    if (response.statusCode != 200)
      return throw '[ConsultarModelos] Algo de errado não está certo';

    List veiculos = convert.jsonDecode(response.body)['Modelos'];
    return veiculos.map((v) => MarcaModeloModel.fromJson(v)).toList();
  }

  Future<List<MarcaModeloModel>> consultarAnoModelo(
    String tipoVeiculo,
    String codigoMarca,
    String codigoModelo,
  ) async {
    final anoModeloApi = '/ConsultarAnoModelo';
    var response = await http.post(
      Uri.https(basePath, apiPath + anoModeloApi),
      body: {
        'codigoTipoVeiculo': tipoVeiculo,
        'codigoTabelaReferencia': referenciaTabela,
        'codigoModelo': codigoModelo,
        'codigoMarca': codigoMarca,
      },
    );
    if (response.statusCode != 200)
      return throw '[ConsultarAnoModelo] Algo de errado não está certo';

    List veiculos = convert.jsonDecode(response.body);
    return veiculos.map((v) => MarcaModeloModel.fromJson(v)).toList();
  }

  Future<List<MarcaModeloModel>> consultarModelosAtravesDoAno(
    String tipoVeiculo,
    String codigoMarca,
    String codigoModelo,
    String ano,
    String codigoTipoCombustivel,
    String anoModelo,
  ) async {
    final anoModeloApi = '/ConsultarModelosAtravesDoAno';
    var response = await http.post(
      Uri.https(basePath, apiPath + anoModeloApi),
      body: {
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

    List veiculos = convert.jsonDecode(response.body);
    return veiculos.map((v) => MarcaModeloModel.fromJson(v)).toList();
  }

  Future<ModeloModel> consultarValorComTodosParametros(
    String tipoVeiculo,
    String codigoMarca,
    String codigoModelo,
    String codigoTipoCombustivel,
    String anoModelo,
  ) async {
    final valorComParametrosApi = '/ConsultarValorComTodosParametros';
    var response = await http.post(
      Uri.https(basePath, apiPath + valorComParametrosApi),
      body: {
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

    final jsonBody = convert.jsonDecode(response.body);
    return ModeloModel.fromJson(jsonBody);
  }
}
