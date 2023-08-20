import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Quantos quadrados perfeitos existem entre 0 e 100?',
      'respostas': [
        {'texto': '7', 'pontuacao': 2},
        {'texto': '6', 'pontuacao': 1},
        {'texto': '9', 'pontuacao': 3},
        {'texto': '10', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Quantos divisores tem o número 2800?',
      'respostas': [
        {'texto': '25 divisores', 'pontuacao': 1},
        {'texto': '29 divisores', 'pontuacao': 3},
        {'texto': '27 divisores', 'pontuacao': 2},
        {'texto': '30 divisores', 'pontuacao': 4},
      ],
    },
    {
      'texto':
          'A soma do dobro de três números consecutivos é igual a 42. Qual o valor do produto entre o menor número e o maior número?',
      'respostas': [
        {'texto': '43', 'pontuacao': 2},
        {'texto': '56', 'pontuacao': 3},
        {'texto': '42', 'pontuacao': 1},
        {'texto': '48', 'pontuacao': 4},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
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
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
