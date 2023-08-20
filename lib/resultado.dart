import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  String get fraseResultado {
    if (pontuacao <= 3) {
      return 'Estude mais!';
    } else if (pontuacao <= 6) {
      return 'Mediano!';
    } else if (pontuacao <= 9) {
      return 'Muito bem!!';
    } else {
      return 'Excelente!!!';
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
