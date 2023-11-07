import 'package:flutter/material.dart';
import 'package:intro/question_screen.dart';

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
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionScreen()),
                  );
                },
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
