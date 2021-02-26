import 'package:flutter/material.dart';

class BarraGrafico extends StatelessWidget {
  final String nome;
  final double valorGasto;
  final double porcentagemValorTotal;

  BarraGrafico(this.nome, this.valorGasto, this.porcentagemValorTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 20,
            child:
                FittedBox(child: Text('R\$${valorGasto.toStringAsFixed(0)}'))),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: porcentagemValorTotal,
                child: Container(
                    decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                )),
              )
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(nome),
      ],
    );
  }
}
