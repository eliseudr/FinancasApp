import 'package:flutter/material.dart';

class NovaTransacao extends StatefulWidget {
  final Function addTx;

  NovaTransacao(this.addTx);

  @override
  _NovaTransacaoState createState() => _NovaTransacaoState();
}

class _NovaTransacaoState extends State<NovaTransacao> {
  final tituloControler = TextEditingController();

  final valorControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: double.infinity,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Titulo'),
              controller: tituloControler,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor'),
              controller: valorControler,
              onSubmitted: (_) => submitData(),
            ),
            //BTN Adicionar Transacoes
            RaisedButton(
              child: Text('Adicionar'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }

  void submitData() {
    final tituloEntrado = tituloControler.text;
    final valorEntrado = double.parse(valorControler.text);

    if (tituloEntrado.isEmpty || valorEntrado <= 0) {
      return;
    }

    widget.addTx(
      tituloEntrado,
      valorEntrado,
    );

    Navigator.of(context).pop();
  }
}
