import './transacoes_list.dart';
import './nova_transacao.dart';
import 'package:flutter/material.dart';
import '../models/transacoes.dart';

class UsuarioTransacoes extends StatefulWidget {
  @override
  _UsuarioTransacoesState createState() => _UsuarioTransacoesState();
}

class _UsuarioTransacoesState extends State<UsuarioTransacoes> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NovaTransacao(_adicionarNovaTransacao),
        ListaTransacoes(_usuarioTransacoes),
      ],
    );
  }
}
