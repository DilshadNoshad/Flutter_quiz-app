import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  // const Quiz({Key? key}) : super(key: key);
  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Question(
            questions[questionIndex]['questionText'] as String,
          ),
          ...(questions[questionIndex]['aswers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(
              () => answerQuestion(answer['score']),
              answer['text'] as String,
            );
          }).toList()
        ],
      ),
    );
  }
}
