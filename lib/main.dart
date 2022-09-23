import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questao.dart';
import './resposta.dart';
import './questionario.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é seu sabor favorito?',
      'respostas': [
        {'texto': 'Laranja', 'nota': 10},
        {'texto': 'Limão', 'nota': 5},
        {'texto': 'Uva', 'nota': 3},
        {'texto': 'Guaraná', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 5},
        {'texto': 'Cachorro', 'nota': 10},
        {'texto': 'Leão', 'nota': 3},
        {'texto': 'Tigre', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual é seu time favorito?',
      'respostas': [
        {'texto': 'Ceara', 'nota': 1},
        {'texto': 'Cruzeiro', 'nota': 3},
        {'texto': 'Internacional', 'nota': 5},
        {'texto': 'Flamengo', 'nota': 10},
      ]
    },
  ];

  void _reiniciarQuestionario() {
    setState(() {
    _perguntaSelecionada = 0;
    _pontuacaoTotal = 0;      
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
