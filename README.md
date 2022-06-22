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
    var listMarcas = await FipeApi().consultarMarcas("1");      
}
```

Métodos que a pub disponibiliza:
```dart
consultarMarcas(
  String tipoVeiculo,
)
```
```dart
consultarModelos(
  String tipoVeiculo,
  String codigoMarca,
)
```
```dart
consultarAnoModelo(
  String tipoVeiculo, 
  String codigoMarca, 
  String codigoModelo,
)
```
```dart
consultarModelosAtravesDoAno(
  String tipoVeiculo, 
  String codigoMarca, 
  String codigoModelo, 
  String ano, 
  String codigoTipoCombustivel, 
  String anoModelo,
)
```
```dart
consultarValorComTodosParametros(
  String tipoVeiculo, 
  String codigoMarca, 
  String codigoModelo, 
  String codigoTipoCombustivel, 
  String anoModelo,
)
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
