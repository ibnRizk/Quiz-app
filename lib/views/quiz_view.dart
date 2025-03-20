import 'package:flutter/material.dart';
import 'package:qeustion_app/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  List<Icon> responseIcon = [];
  int numberOfTrue = 0;
  int numberOfFalse = 0;
  void checkAnswers(bool userAnswer) {
    setState(
      () {
        if (quizBrain.isfinished() == true) {
          Alert(
                  context: context,
                  title: "Finished!",
                  desc:
                      "You're reached the end of the quiz(correct=$numberOfTrue incorrect=$numberOfFalse)")
              .show();
          quizBrain.reset();
          responseIcon.clear();
        } else {
          if (userAnswer == quizBrain.getanswer()) {
            responseIcon.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
            numberOfTrue++;
          } else {
            responseIcon.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
            numberOfFalse++;
          }
        }

        quizBrain.nextquestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizBrain.getquestion(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            child: Container(
              color: Colors.green,
              child: Center(
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            onPressed: () {
              checkAnswers(true);
            },
          ),
        ),
        Expanded(
          child: TextButton(
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            onPressed: () {
              checkAnswers(false);
            },
          ),
        ),
        Row(
          children: responseIcon,
        )
      ],
    );
  }
}
