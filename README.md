![Logo fipe flutter](https://github.com/leonardobenedeti/fipe_flutter/blob/main/assets/fipe_flutter_logo.png?raw=true)

### Pub para auxiliar na consulta de veículos FIPE.

O site da FIPE faz as requisições em um endpoint aberto, caso queira fazer o mesmo processo sem a Pub ou em outra linguagem, siga o fluxo:


Abra o site da FIPE > Abra o Developer Console na aba Network > Faça uma consulta no site da fipe e repare as respostas dos métodos > O retorno é um json aberto simples. Possibilitando assim um post padrão passando os parametros. 

A pub apenas facilita esse trabalho pra quem deseja usar com dart.


## App Example
![Example fipe flutter](https://github.com/leonardobenedeti/fipe_flutter/blob/main/assets/example_fipe_flutter.gif?raw=true)


## How to use

```dart
import 'package:fipe_flutter/fipe_flutter.dart';

```

```dart
Future fetchMarcas() async {
    var listMarcas = await FipeApi().consultarMarcas(tipoVeiculo: "1");      
}
```

Para usar um Http Client customizado
```dart
Future fetchMarcas() async {
  var listMarcas = await FipeApi(client: Dio()).consultarMarcas(tipoVeiculo: "1");
}
```

Métodos que a pub disponibiliza:
```dart
consultarMarcas({
  required String tipoVeiculo,
  Options? options,
})
```
```dart
consultarModelos({
  required String tipoVeiculo,
  required String codigoMarca,
  Options? options,
})
```
```dart
consultarAnoModelo({
  required String tipoVeiculo,
  required String codigoMarca,
  required String codigoModelo,
  Options? options,
})
```
```dart
consultarModelosAtravesDoAno({
  required String tipoVeiculo,
  required String codigoMarca,
  required String codigoModelo,
  required String ano,
  required String codigoTipoCombustivel,
  required String anoModelo,
  Options? options,
})
```
```dart
consultarValorComTodosParametros({
  required String tipoVeiculo,
  required String codigoMarca,
  required String codigoModelo,
  required String codigoTipoCombustivel,
  required String anoModelo,
  Options? options,
})
```

Único parâmetro que tem valores pré-definidos é o Tipo de Veículo
**tipoVeiculo**: '1' - Carro | '2' - Moto | '3' - Caminhões e Micro-Ônibus

Os outros dependem da resposta das apis. Os testes e app example mostram as chamadas encadeadas, vale dar uma olhada. 
**codigoMarca**: exemplo: '6' - Audi
**codigoModelo**: exemplo: '48' - 80 2.6/ 2.8
**ano**: exemplo: '1995-1' - 1995 Gasolina
**codigoTipoCombustivel**: exemplo: '1' - Gasolina
**anoModelo**: exemplo: '1995' - 1995

## Contribuintes
Só mandar um PR =D

| [<img src="https://avatars.githubusercontent.com/u/4130653?v=4" width="115"><br><small>@olimou</small>](https://github.com/olimou) |
|:-----------------------------------------------------------------------------------------------------------------------------:|

## Autor
| [<img src="https://avatars.githubusercontent.com/u/10719847?v=4" width="115"><br><small>@leonardobenedeti</small>](https://github.com/leonardobenedeti) |
| :---: |

### DISCLAIMER: Pub NÃO OFICIAL do Fundação Instituto de Pesquisas Economicas (FIPE)
