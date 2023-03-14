import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(double) onAnswer;

  const Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Questao(perguntas[perguntaSelecionada].cast()['pergunta']),
      ...(perguntas[perguntaSelecionada]['repostas']
              as List<Map<String, Object>>)
          .map((e) => Resposta(e['texto'].toString(),
              () => {onAnswer(double.parse(e['pontuacao'].toString()))}))
          .toList()
    ]);
  }
}
