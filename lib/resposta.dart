import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() quandoRespondido;

  const Resposta(this.resposta, this.quandoRespondido);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(onPressed: quandoRespondido, child: Text(resposta)),
    );
  }
}
