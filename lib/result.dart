import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() handleRestartQuiz;

  Result(this.score, this.handleRestartQuiz);

  String get resultText {
    if (score < 8) {
      return 'Parabéns!';
    } else if (score < 12) {
      return 'Você é bom!';
    } else if (score < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(resultText, style: const TextStyle(fontSize: 28))),
        TextButton(
            onPressed: handleRestartQuiz,
            child: const Text(
              'Reiniciar',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ))
      ],
    );
  }
}
