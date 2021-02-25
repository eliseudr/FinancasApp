import 'package:flutter/material.dart';

import './widgets/nova_transacao.dart';
import './models/transacoes.dart';
import './widgets/transacoes_list.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transacoes> _usuarioTransacoes = [
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

  void _adicionarNovaTransacao(String novoTitulo, double novoValor) {
    final novaTx = Transacoes(
      titulo: novoTitulo,
      valor: novoValor,
      data: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _usuarioTransacoes.add(novaTx);
    });
  }

  void _abreNovaTransacao(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NovaTransacao(_adicionarNovaTransacao),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finanças'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _abreNovaTransacao(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                  color: Colors.blue,
                  child: Text('CHART', textAlign: TextAlign.center)),
            ),
            ListaTransacoes(_usuarioTransacoes),
          ],
        ),
      ),
    );
  }
}
