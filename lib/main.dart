import 'package:flutter/material.dart';
import 'package:intro/model/quiz_question.dart';
import 'package:intro/data/questions.dart';

void main() {
  runApp(
    const MaterialApp(
      home: QuestionScreen(),
    ),
  );
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/quiz.jpeg'),
              const Text(
                "Quiz App",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
                label: const Text("Start"),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
