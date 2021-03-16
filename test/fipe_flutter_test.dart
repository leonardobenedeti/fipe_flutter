import 'package:flutter_test/flutter_test.dart';

import 'package:fipe_flutter/fipe_flutter.dart';

void main() {
  FipeApi fipeApi;
  const marca = '20';
  const versao = '7502';
  const modelo = '2019-1';
  const textModelo = '488 GTB 3.9 V8 670cv';

  setUpAll(() {
    fipeApi = FipeApi();
  });

  test('Requisição para mostrar todas as marcas na api FIPE', () async {
    var expectedMarcas = await fipeApi.marcas();
    expect(expectedMarcas.isNotEmpty, true);
  });

  test('Requisição para mostrar todos veiculos na api FIPE', () async {
    var expectedVeiculos = await fipeApi.veiculos(marca);
    expect(expectedVeiculos.isNotEmpty, true);
  });

  test('Requisição para mostrar todos versoes na api FIPE', () async {
    var expectedVersoes = await fipeApi.versoes(marca, versao);
    expect(expectedVersoes.isNotEmpty, true);
  });

  test('Requisição para mostrar todos modelos na api FIPE', () async {
    var expectedModelo = await fipeApi.modelos(marca, versao, modelo);
    expect(expectedModelo.name, textModelo);
  });
}
