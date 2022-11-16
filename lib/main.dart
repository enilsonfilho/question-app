import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Panda', 'Elefante'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
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
    List<String> respostas = temPerguntaSeleciona
        ? _perguntas[_perguntaSelecionada]['respostas']
        : [];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas?'),
        backgroundColor: Colors.orange,
      ),
      body: temPerguntaSeleciona
          ? Column(
              children: [
                Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                ...respostas.map((t) => Resposta(t, _responder)).toList(),
              ],
            )
          : Center(
              child: Text(
                'Parabéns',
                style: TextStyle(fontSize: 28),
              ),
            ),
      )
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
