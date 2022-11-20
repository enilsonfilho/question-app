import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String,Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 2}, 
        {'texto': 'Vermelho', 'pontuacao': 4}, 
        {'texto': 'Branco', 'pontuacao': 6},
        {'texto': 'Verde', 'pontuacao': 10}, 
        ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 2}, 
        {'texto': 'Cobra', 'pontuacao': 4}, 
        {'texto': 'Elefante', 'pontuacao': 6},
        {'texto': 'Panda', 'pontuacao': 10}, 
        ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 2}, 
        {'texto': 'João', 'pontuacao': 3}, 
        {'texto': 'Pedro', 'pontuacao': 3},
        {'texto': 'Leo', 'pontuacao': 10}, 
        ],
    },
  ].cast();

  void _responder(int pontuacao) {
    if (temPerguntaSeleciona) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      )
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
