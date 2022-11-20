import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String,Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10}, 
        {'texto': 'Vermelho', 'nota': 5}, 
        {'texto': 'Verde', 'nota': 3}, 
        {'texto': 'Branco', 'nota': 1}
        ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10}, 
        {'texto': 'Cobra', 'nota': 7}, 
        {'texto': 'Panda', 'nota': 8}, 
        {'texto': 'Elefante', 'nota': 10}
        ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 4}, 
        {'texto': 'João', 'nota': 9}, 
        {'texto': 'Leo', 'nota': 10}, 
        {'texto': 'Pedro', 'nota': 9}
        ],
    },
  ].cast();

  void _responder() {
    if (temPerguntaSeleciona) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSeleciona {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
            backgroundColor: Colors.orange,
          ),
          body: temPerguntaSeleciona
          ? Questionario(
            perguntas: _perguntas, 
            perguntaSelecionada: _perguntaSelecionada, 
            quandoResponder: _responder
            )
          : Resultado(),
      )
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
