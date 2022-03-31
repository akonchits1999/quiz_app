import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

//import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is ur favorite colour',
      'answers': [
        {'text': 'Black', 'points': 3},
        {'text': 'Red', 'points': 2},
        {'text': 'Blue', 'points': 1},
        {'text': 'White', 'points': 0}
      ],
    },
    {
      'questionText': 'What is ur favorite animal?',
      'answers': [
        {'text': 'wolf', 'points': 3},
        {'text': 'cat', 'points': 2},
        {'text': 'mouse', 'points': 1},
        {'text': 'hamster', 'points': 0}
      ]
    },
    {
      'questionText': 'What is ur favorite country?',
      'answers': [
        {'text': 'Ukraine', 'points': 3},
        {'text': 'Russia', 'points': 2},
        {'text': 'USA', 'points': 1},
        {'text': 'Belarus', 'points': 0}
      ],
    }
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
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext) {
    /* 'What is ur favorite beard?',
       'What is ur favorite song?',
       'What is ur favorite film?',
       'What is ur favorite dish?',*/
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,)
              : Result(_totalScore,_resetQuiz)),
    );
  }
}
