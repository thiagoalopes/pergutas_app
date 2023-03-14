import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/reultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  double _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'repostas': [
        {'texto': 'verde', 'pontuacao': 8},
        {'texto': 'vermelho', 'pontuacao': 5},
        {'texto': 'rosa', 'pontuacao': 3},
        {'texto': 'azul', 'pontuacao': 10},
        {'texto': 'amarelo', 'pontuacao': 6}
      ],
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'repostas': [
        {'texto': 'cachorro', 'pontuacao': 10},
        {'texto': 'gato', 'pontuacao': 7},
        {'texto': 'passarinho', 'pontuacao': 9},
        {'texto': 'rato', 'pontuacao': 0},
        {'texto': 'macaco', 'pontuacao': 6}
      ]
    }
  ];

  void _responder(double pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void reiniciarQuetionario() {
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
        title: const Text('Perguntas App'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              onAnswer: _responder)
          : Resultado(
              pontuacao: _pontuacaoTotal,
              reiniciar: reiniciarQuetionario,
            ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
