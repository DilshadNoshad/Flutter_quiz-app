import 'package:flutter/material.dart';
import 'package:flutter_app/result.dart';
import './quiz.dart';
import './result.dart';
// import './question.dart';
// import './answer.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  // @override
  // State<MyApp> createState() => MyAppState();
  @override
  State<MyApp> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'aswers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3}
      ]
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'aswers': [
        {'text': 'Dog', 'score': 8},
        {'text': 'Cat', 'score': 6},
        {'text': 'Parrot', 'score': 2},
        {'text': 'Rabbit', 'score': 1}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // setState(() {
    //   _questionIndex = _questionIndex + 1;
    // });
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("WE HAVE MORE QUESTIONS");
    } else {
      print("NO MORE QUESTIONS");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
