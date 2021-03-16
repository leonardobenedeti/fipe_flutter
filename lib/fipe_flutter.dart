library fipe_flutter;

import 'package:fipe_flutter/models/marca.dart';
import 'package:fipe_flutter/models/modelo.dart';
import 'package:fipe_flutter/models/versao.dart';
import 'package:fipe_flutter/models/veiculo.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class FipeApi {
  static const basePath = 'https://fipeapi.appspot.com/api/1';

  Future<List<MarcaModel>> marcas() async {
    const marcasApi = '/carros/marcas.json';

    var response = await http.get(basePath + marcasApi);
    if (response.statusCode != 200)
      return throw '[Marcas] Algo de errado não está certo';

    List marcas = convert.jsonDecode(response.body);
    return marcas.map((marca) => MarcaModel.fromJson(marca)).toList();
  }

  Future<List<VeiculoModel>> veiculos(String marca) async {
    final veiculosApi = '/carros/veiculos/$marca.json';
    var response = await http.get(basePath + veiculosApi);
    if (response.statusCode != 200)
      return throw '[Veículos] Algo de errado não está certo';

    List veiculos = convert.jsonDecode(response.body);
    return veiculos.map((v) => VeiculoModel.fromJson(v)).toList();
  }

  Future<List<VersaoModel>> versoes(String marca, String versao) async {
    final versoesApi = '/carros/veiculo/$marca/$versao.json';
    var response = await http.get(basePath + versoesApi);
    if (response.statusCode != 200)
      return throw '[Versões] Algo de errado não está certo';

    List versoes = convert.jsonDecode(response.body);
    return versoes.map((v) => VersaoModel.fromJson(v)).toList();
  }

  Future<ModeloModel> modelos(
      String marca, String versao, String modelo) async {
    final modelosApi = '/carros/veiculo/$marca/$versao/$modelo.json';
    var response = await http.get(basePath + modelosApi);
    if (response.statusCode != 200)
      return throw '[Modelo] Algo de errado não está certo';

    final jsonBody = convert.jsonDecode(response.body);
    return ModeloModel.fromJson(jsonBody);
  }
}
