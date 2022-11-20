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
        {'texto': 'Preto', 'pontuacao': 10}, 
        {'texto': 'Vermelho', 'pontuacao': 5}, 
        {'texto': 'Verde', 'pontuacao': 3}, 
        {'texto': 'Branco', 'pontuacao': 1}
        ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10}, 
        {'texto': 'Cobra', 'pontuacao': 7}, 
        {'texto': 'Panda', 'pontuacao': 8}, 
        {'texto': 'Elefante', 'pontuacao': 10}
        ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 4}, 
        {'texto': 'João', 'pontuacao': 9}, 
        {'texto': 'Leo', 'pontuacao': 10}, 
        {'texto': 'Pedro', 'pontuacao': 9}
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

    print(_pontuacaoTotal);
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
          : Resultado(_pontuacaoTotal),
      )
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
