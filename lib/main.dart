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
        {'texto': 'Preto', 'ponto': 10}, 
        {'texto': 'Vermelho', 'ponto': 5}, 
        {'texto': 'Verde', 'ponto': 3}, 
        {'texto': 'Branco', 'ponto': 1}
        ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'ponto': 10}, 
        {'texto': 'Cobra', 'ponto': 7}, 
        {'texto': 'Panda', 'ponto': 8}, 
        {'texto': 'Elefante', 'ponto': 10}
        ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'ponto': 4}, 
        {'texto': 'João', 'ponto': 9}, 
        {'texto': 'Leo', 'ponto': 10}, 
        {'texto': 'Pedro', 'ponto': 9}
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
