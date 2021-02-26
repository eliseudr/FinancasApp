import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NovaTransacao extends StatefulWidget {
  final Function addTx;

  NovaTransacao(this.addTx);

  @override
  _NovaTransacaoState createState() => _NovaTransacaoState();
}

class _NovaTransacaoState extends State<NovaTransacao> {
  final _tituloControler = TextEditingController();
  final _valorControler = TextEditingController();
  DateTime _diaEscolhido;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: double.infinity,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Titulo'),
              controller: _tituloControler,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor'),
              controller: _valorControler,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(_diaEscolhido == null
                      ? 'Data nao selecionada:'
                      : '${DateFormat.d().format(_diaEscolhido)}/${DateFormat.yM().format(_diaEscolhido)}'),
                  //BTN Selecionar data
                  FlatButton(
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text(
                      'Escolha a data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _selecionarData,
                  ),
                  SizedBox(width: 10),
                  //BTN Adicionar Transacoes
                  RaisedButton(
                    child: Text('Adicionar'),
                    color: Theme.of(context).primaryColor,
                    onPressed: _submitData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitData() {
    final tituloEntrado = _tituloControler.text;
    final valorEntrado = double.parse(_valorControler.text);

    if (tituloEntrado.isEmpty || valorEntrado <= 0 || _diaEscolhido == null) {
      return;
    }

    widget.addTx(
      tituloEntrado,
      valorEntrado,
      _diaEscolhido,
    );

    Navigator.of(context).pop();
  }

  void _selecionarData() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((diaEscolhido) {
      if (diaEscolhido == null) {
        return;
      }
      setState(() {
        _diaEscolhido = diaEscolhido;
      });
    });
  }
}
