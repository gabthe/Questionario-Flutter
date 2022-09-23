import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);
  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Nivel Bronze!';
    } else if (pontuacao < 12) {
      return 'Nivel Silver!';
    } else if (pontuacao < 16) {
      return 'Nivel Gold!';
    } else {
      return 'Nivel Diamante!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Pontuação total: ${pontuacao}', style: TextStyle(fontSize: 28),),
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: quandoReiniciarQuestionario,
            child: Text(
              'Retonar ao começo',
            ))
      ],
    );
  }
}
