import 'package:fipe_flutter/fipe_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FipeApi fipeApi = FipeApi();
  const tipoVeiculo = '1';
  const codigoMarca = '6';
  const codigoModelo = '48';
  const ano = '1995-1';
  const codigoTipoCombustivel = '1';
  const anoModelo = '1995';
  const textModelo = '80 2.6/ 2.8';

  setUpAll(() {
    fipeApi = FipeApi();
  });

  test('Requisição: ConsultarMarcas ', () async {
    var expectedMarcas = await fipeApi.consultarMarcas(
      tipoVeiculo,
    );
    expect(expectedMarcas.isNotEmpty, true);
  });

  test('Requisição: ConsultarModelos', () async {
    var expectedVeiculos = await fipeApi.consultarModelos(
      tipoVeiculo,
      codigoMarca,
    );
    expect(expectedVeiculos.isNotEmpty, true);
  });

  test('Requisição: ConsultarAnoModelo ', () async {
    var expectedVeiculos = await fipeApi.consultarAnoModelo(
      tipoVeiculo,
      codigoMarca,
      codigoModelo,
    );
    expect(expectedVeiculos.isNotEmpty, true);
  });

  test('Requisição: ConsultarModelosAtravesDoAno ', () async {
    var expectedVeiculos = await fipeApi.consultarModelosAtravesDoAno(
      tipoVeiculo,
      codigoMarca,
      codigoModelo,
      ano,
      codigoTipoCombustivel,
      anoModelo,
    );
    expect(expectedVeiculos.isNotEmpty, true);
  });

  test('Requisição: ConsultarValorComTodosParametros ', () async {
    var expectedVeiculos = await fipeApi.consultarValorComTodosParametros(
      tipoVeiculo,
      codigoMarca,
      codigoModelo,
      codigoTipoCombustivel,
      anoModelo,
    );
    expect(expectedVeiculos.modelo, textModelo);
  });
}
