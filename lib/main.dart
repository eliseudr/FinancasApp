import 'package:financas/transacoes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finanças',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transacoes> transacoes = [
    Transacoes(
      id: 't1',
      titulo: 'Lanche sanduiche',
      valor: 32.45,
      data: DateTime.now(),
    ),
    Transacoes(
      id: 't2',
      titulo: 'Mouse',
      valor: 250,
      data: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
                color: Colors.blue,
                child: Text('CHART', textAlign: TextAlign.center)),
          ),
          _transacao(),
        ],
      ),
    );
  }

  Column _transacao() {
    return Column(
      children: transacoes.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                padding: EdgeInsets.all(10),
                child: Text(tx.valor.toString()),
              ),
              Column(
                children: <Widget>[
                  Text(tx.titulo),
                  Text(tx.data.toString()),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
