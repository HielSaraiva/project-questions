import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  String get fraseResultado {
    if (pontuacao == 0) {
      return 'Estude mais! 😓 0/3';
    } else if (pontuacao == 1) {
      return 'Mediano! 😕 1/3';
    } else if (pontuacao == 2) {
      return 'Muito bem!! 👏 2/3';
    } else {
      return 'Excelente!!! 🥳 3/3';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
            onPressed: quandoReiniciarQuestionario,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
            ),
            child: const Text(
              "Reiniciar?",
              style: TextStyle(fontSize: 18),
            )),
      ],
    );
  }
}
