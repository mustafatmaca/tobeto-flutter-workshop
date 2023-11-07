import 'package:flutter/material.dart';
import 'package:intro/data/questions.dart';
import 'package:intro/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  int questionNumber = 0;
  int questionsLength = questions.length;
  List<int> answersIndex = [];

  void changeQuestion() {
    setState(() {
      questionNumber++;
    });
  }

  void saveAnswer(int index) {
    answersIndex.add(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "${questionNumber + 1}/$questionsLength",
          style: const TextStyle(color: Colors.blueAccent),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(questions[questionNumber].question),
              ...questions[questionNumber].answers.map((answer) {
                return ElevatedButton(
                  onPressed: () {
                    if (questionNumber < questionsLength - 1) {
                      saveAnswer(
                          questions[questionNumber].answers.indexOf(answer));
                      changeQuestion();
                    } else if (questionNumber == questionsLength - 1) {
                      saveAnswer(
                          questions[questionNumber].answers.indexOf(answer));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(answersIndex)),
                      );
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
