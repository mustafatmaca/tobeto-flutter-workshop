import 'package:flutter/material.dart';
import 'package:intro/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  int questionNumber = 0;

  void changeQuestion() {
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(questions[questionNumber].question),
              ...questions[questionNumber].answers.map((answer) {
                return ElevatedButton(
                  onPressed: () {
                    if (questionNumber < 3) {
                      changeQuestion();
                    }
                  },
                  child: Text(answer),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
