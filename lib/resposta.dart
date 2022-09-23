import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Resposta extends StatelessWidget {
  String texto = '';
  final void Function() quandoSelecionado;
  
  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          textStyle: TextStyle(
            color: Colors.white
          )
        ),
        child: Text(texto),
      ),
    );
  }
}
