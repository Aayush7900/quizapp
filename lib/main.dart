import 'package:flutter/material.dart';
import 'package:quizapp/quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List <Widget> scoreKeeper = [];
/*
  List <String> questions = [
    ,
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List<bool> answers = [
    false,
    true,
    true
  ];*/


  int questionNo = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionbank[questionNo].questionText ?? 'no question available',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            child: Text(
              'True',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              setState(() {
                bool correctAnswer = quizBrain.questionbank[questionNo].questionAnswer ?? false;

                if (correctAnswer == true) {
                  print('user got it right');
                } else {
                  print('user got it wrong');
                }

                questionNo++;
              });
            },
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            child: Text(
              'False',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              bool correctAnswer = quizBrain.questionbank[questionNo].questionAnswer ?? false;

              if (correctAnswer == false) {
                print('user got it right');
              } else {
                print('user got it wrong');
              }
              setState(() {
                questionNo++;
              });
            },
          ),
        )),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
