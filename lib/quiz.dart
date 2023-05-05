import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;

  final void Function(int) responder;

  bool get isSelectedQuestion {
    return questionSelected < questions.length;
  }

  Quiz({
    required this.questions,
    required this.questionSelected,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? answers = isSelectedQuestion
        ? questions[questionSelected]
            .cast()['answers'] /* as List<Map<String,Object>> */
        : null;

    return Column(
      children: <Widget>[
        Question(questions[questionSelected]['text'].toString()),
        ...answers!
            .map((answer) => Answer(answer['text'] as String,
                () => responder(int.parse(answer['score'].toString()))))
            .toList(),
      ],
    );
  }
}
