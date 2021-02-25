import '../models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaTransacoes extends StatelessWidget {
  final List<Transacoes> transacoes;

  ListaTransacoes(this.transacoes);

  @override
  //Campos onde ficaram registrados os gastos
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                //Campo do valor
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${transacoes[index].valor.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Titulo da transacao
                    Text(transacoes[index].titulo,
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.title),
                    //Data da transacao
                    Text(DateFormat.yMMMd().format(transacoes[index].data),
                        style:
                            TextStyle(color: Colors.grey[850], fontSize: 12)),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transacoes.length,
      ),
    );
  }
}
