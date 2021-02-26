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
      height: 500,
      child: transacoes.isEmpty
          ? Column(children: <Widget>[
              // ignore: deprecated_member_use
              Text('Sem despesas...', style: Theme.of(context).textTheme.title),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: FittedBox(
                              child: Text('R\$${transacoes[index].valor}'))),
                    ),
                    title: Text(transacoes[index].titulo,
                        style: Theme.of(context).textTheme.title),
                    subtitle:
                        Text(DateFormat.yMMMd().format(transacoes[index].data)),
                  ),
                );
              },
              itemCount: transacoes.length,
            ),
    );
  }
}
