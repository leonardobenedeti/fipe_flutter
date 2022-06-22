import 'package:example/indexed_iterable_extension.dart';
import 'package:fipe_flutter/fipe_flutter.dart';
import 'package:fipe_flutter/models/marca_modelo_model.dart';
import 'package:fipe_flutter/models/modelo_completo_model.dart';
import 'package:flutter/material.dart';

class FipeUsagePage extends StatefulWidget {
  @override
  _FipeUsagePageState createState() => _FipeUsagePageState();
}

class _FipeUsagePageState extends State<FipeUsagePage> {
  FipeApi fipeApi = FipeApi();
  bool loading = false;
  bool error = false;

  List<MarcaModeloModel> marcas = [];
  MarcaModeloModel? marcaSelecionada;

  List<MarcaModeloModel> modelos = [];
  MarcaModeloModel? modeloSelecionado;

  List<MarcaModeloModel> modelosAno = [];
  MarcaModeloModel? modeloAnoSelecionado;

  ModeloModel? modeloDetalhado;

  @override
  void initState() {
    super.initState();
    fetchMarcas();
  }

  Future fetchMarcas() async {
    setState(() {
      loading = true;
      error = false;

      marcaSelecionada = null;
      modeloSelecionado = null;
      modeloAnoSelecionado = null;
      modeloDetalhado = null;
    });
    try {
      var list = await fipeApi.consultarMarcas(
        tipoVeiculo: "1",
      );
      setState(() => marcas = list);
    } catch (e) {
      setState(() => error = true);
    }
    setState(() => loading = false);
  }

  Future fetchModelos() async {
    setState(() {
      loading = true;
      error = false;

      modeloSelecionado = null;
      modeloAnoSelecionado = null;
      modeloDetalhado = null;
    });
    try {
      var list = await fipeApi.consultarModelos(
        tipoVeiculo: "1",
        codigoMarca: marcaSelecionada?.value ?? "",
      );
      setState(() => modelos = list);
    } catch (e) {
      setState(() => error = true);
    }
    setState(() => loading = false);
  }

  Future fetchAnoModelos() async {
    setState(() {
      loading = true;
      error = false;

      modeloAnoSelecionado = null;
      modeloDetalhado = null;
    });
    try {
      var list = await fipeApi.consultarAnoModelo(
        tipoVeiculo: "1",
        codigoMarca: marcaSelecionada?.value ?? "",
        codigoModelo: modeloSelecionado?.value ?? "",
      );
      setState(() => modelosAno = list);
    } catch (e) {
      setState(() => error = true);
    }
    setState(() => loading = false);
  }

  Future fetchModeloDetalhado() async {
    setState(() {
      loading = true;
      error = false;
    });
    try {
      final anoCombustivel = modeloAnoSelecionado?.value?.split('-');

      var modeloModel = await fipeApi.consultarValorComTodosParametros(
        tipoVeiculo: "1",
        codigoMarca: marcaSelecionada?.value ?? "",
        codigoModelo: modeloSelecionado?.value ?? "",
        codigoTipoCombustivel: anoCombustivel?[1] ?? "",
        anoModelo: anoCombustivel?[0] ?? "",
      );
      setState(() => modeloDetalhado = modeloModel);
    } catch (e) {
      setState(() => error = true);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("Fipe Flutter"),
          ),
          body: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Selecionar marca
                MaterialButton(
                  child: Text("Selecionar marcas"),
                  color: Colors.blueGrey,
                  onPressed: () =>
                      _askedToLead("Marcas", marcas, marcaSelecionada, (marca) {
                    setState(() => marcaSelecionada = marca);
                    fetchModelos();
                  }),
                ),

                if (marcaSelecionada != null) ...[
                  Text(marcaSelecionada?.label ?? ""),

                  // Selecionar modelos
                  MaterialButton(
                    child: Text("Selecionar Modelos"),
                    color: Colors.blueGrey,
                    onPressed: () => _askedToLead(
                        "Modelos", modelos, modeloSelecionado, (modelo) {
                      setState(() => modeloSelecionado = modelo);
                      fetchAnoModelos();
                    }),
                  ),

                  if (modeloSelecionado != null) ...[
                    Text(modeloSelecionado?.label ?? ""),

                    // Selecionar Anos dos carros pelo modelo
                    MaterialButton(
                      child: Text("Selecionar Anos dos carros pelo modelo"),
                      color: Colors.blueGrey,
                      onPressed: () => _askedToLead(
                          "Anos pelo modelo", modelosAno, modeloAnoSelecionado,
                          (modeloAno) {
                        setState(() {
                          modeloAnoSelecionado = modeloAno;
                          modeloDetalhado = null;
                        });
                      }),
                    ),

                    if (modeloAnoSelecionado != null) ...[
                      Text(modeloAnoSelecionado?.label ?? ""),

                      // Busca detalhada do carro
                      MaterialButton(
                        child: Text("Buscar modelo detalhado"),
                        color: Colors.blueGrey,
                        onPressed: fetchModeloDetalhado,
                      ),

                      if (modeloDetalhado != null) ...[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Modelo detalhado',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ..._detalhesModelo(modeloDetalhado?.toMap()),
                      ]
                    ]
                  ]
                ]
              ],
            ),
          ),
        ),
        if (loading)
          Container(
            color: Colors.black.withAlpha(100),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }

  List<Widget> _detalhesModelo(Map<String, dynamic> map) {
    return map.keys
        .mapIndexed(
          (key, index) => Container(
            color: index % 2 == 0 ? Colors.grey[400] : Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(key),
                Text(map[key].toString()),
              ],
            ),
          ),
        )
        .toList();
  }

  Future<void> _askedToLead(
      String label,
      List<MarcaModeloModel> lista,
      MarcaModeloModel? itemSelecionado,
      Function(MarcaModeloModel) onSelect) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(label),
          children: <Widget>[
            ...lista.map(
              (item) => SimpleDialogOption(
                child: Text(
                  item.label ?? "",
                  style: TextStyle(
                      fontWeight: item == itemSelecionado
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  if (item != itemSelecionado) onSelect(item);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
