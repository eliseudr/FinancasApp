import 'package:flutter/foundation.dart';

class Transacoes {
  String id;
  String titulo;
  double valor;
  DateTime data;

  Transacoes(
      {@required this.id,
      @required this.titulo,
      @required this.valor,
      @required this.data});
}
