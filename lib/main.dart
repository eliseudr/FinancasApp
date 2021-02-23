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
      titulo: 'Computador novo',
      valor: 5.0000,
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
          Column(
            children: transacoes.map((tx) {
              return Card(
                child: Text(tx.titulo),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
