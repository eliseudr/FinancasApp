import '../models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaTransacoes extends StatelessWidget {
  final List<Transacoes> transacoes;

  ListaTransacoes(this.transacoes);

  @override
  //Campos onde ficaram registrados os gastos
  Widget build(BuildContext context) {
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
                child: Text(
                  'R\$ ${tx.valor}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Titulo da transacao
                  Text(tx.titulo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  //Data da transacao
                  Text(DateFormat.yMMMd().format(tx.data),
                      style: TextStyle(color: Colors.grey[850], fontSize: 12)),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
