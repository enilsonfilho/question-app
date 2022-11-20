import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSeleciona {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSeleciona
        ? perguntas[perguntaSelecionada]['respostas'] as List<String>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((t) => Resposta(t, quandoResponder)).toList(),
      ],
    );
  }
}