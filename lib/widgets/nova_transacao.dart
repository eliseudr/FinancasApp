import 'package:flutter/material.dart';

class NovaTransacao extends StatelessWidget {
  final Function addTx;
  final tituloControler = TextEditingController();
  final valorControler = TextEditingController();

  NovaTransacao(this.addTx);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Valor'),
              controller: valorControler,
            ),
            //BTN Adicionar Transacoes
            RaisedButton(
              child: Text('Adicionar'),
              textColor: Colors.purple,
              onPressed: () {
                addTx(
                  tituloControler.text,
                  double.parse(valorControler.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
