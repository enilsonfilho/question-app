import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
        {
          'texto': 'Qual é a sua cor favorita?',
          'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
        },
        {
          'texto': 'Qual é o seu animal favorito?',
          'respostas': ['Coelho', 'Cobra', 'Elefante', 'Elefante'],
        },
        {
          'texto': 'Qual é o seu instrutor favorito?',
          'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
        },
    ].cast();

    List<String> respostas = perguntas[_perguntaSelecionada]['respostas'];

    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
        title: Text('Perguntas?'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
          ...respostas
            .map((t) => Resposta(t, _responder))
            .toList(),
        ],
      ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
