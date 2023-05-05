import 'package:flutter/material.dart';
import 'package:projeto_perguntas/result.dart';
import './quiz.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _questionSelected = 0;
  var _totalScore = 0;

  final List<Map<String, Object>> _questions = [
    {
      'text': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Verde', 'score': 3},
        {'text': 'Branco', 'score': 1},
      ],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answers': [
        {'text': 'Coelho', 'score': 10},
        {'text': 'Cobra', 'score': 5},
        {'text': 'Elefante', 'score': 3},
        {'text': 'Leão', 'score': 1},
      ],
    },
    {
      'text': 'Qual é o seu instrutor favorito?',
      'answers': [
        {'text': 'Leo', 'score': 10},
        {'text': 'Maria', 'score': 5},
        {'text': 'João', 'score': 3},
        {'text': 'Pedro', 'score': 1},
      ],
    },
  ];

  bool get isSelectedQuestion {
    return _questionSelected < _questions.length;
  }

  void _responder(int score) {
    if (isSelectedQuestion) {
      setState(() {
        _questionSelected++;
        _totalScore += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _questionSelected = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: isSelectedQuestion
              ? Quiz(
                  questions: _questions,
                  questionSelected: _questionSelected,
                  responder: _responder)
              : Result(_totalScore, _restartQuiz)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
