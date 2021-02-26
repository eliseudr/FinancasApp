import 'package:flutter/material.dart';
import '../models/transacoes.dart';
import 'package:intl/intl.dart';
import './barra_grafico.dart';

class Grafico extends StatelessWidget {
  final List<Transacoes> transacoesRecentes;

  Grafico(this.transacoesRecentes);

  List<Map<String, Object>> get valoresAgrupados {
    return List.generate(7, (index) {
      final diaSemana = DateTime.now().subtract(
        Duration(days: index),
      );
      var somaTotal = 0.0;

      for (var i = 0; i < transacoesRecentes.length; i++) {
        if (transacoesRecentes[i].data.day == diaSemana.day &&
            transacoesRecentes[i].data.month == diaSemana.month) {
          somaTotal += transacoesRecentes[i].valor;
        }
      }

      return {
        'dia': DateFormat.E().format(diaSemana).substring(0, 3),
        'valor': somaTotal
      };
    });
  }

  double get gastoTotal {
    return valoresAgrupados.fold(
      0.0,
      (soma, item) {
        return soma + item['valor'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: valoresAgrupados.map((data) {
          return BarraGrafico(data['dia'], data['valor'],
              gastoTotal == 0.0 ? 0.0 : (data['valor'] as double) / gastoTotal);
        }).toList(),
      ),
    );
  }
}
