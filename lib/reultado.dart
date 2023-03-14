import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final double pontuacao;
  final void Function() reiniciar;

  get messagem {
    String part = 'Parabéns!!! sua pontuação é $pontuacao... ';
    if (pontuacao < 10) {
      return part + 'Nível: Princesa';
    } else if (pontuacao >= 10 && pontuacao <= 15) {
      return part + 'Nível: Master';
    } else {
      return part + 'Nível: Jedi';
    }
  }

  const Resultado(
      {super.key, required this.pontuacao, required this.reiniciar});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            messagem,
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(onPressed: reiniciar, child: const Text('Reiniciar?'))
      ],
    );
  }
}
