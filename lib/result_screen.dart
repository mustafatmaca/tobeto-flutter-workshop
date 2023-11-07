import 'package:flutter/material.dart';
import 'package:intro/data/questions.dart';
import 'package:intro/start_screen.dart';

class ResultScreen extends StatelessWidget {
  final List<int> answersIndex;

  const ResultScreen(this.answersIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StartScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.blueAccent,
              ),
              tooltip: "Restart Quiz",
            ),
          ],
          title: const Text(
            "Results",
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  ...questions.map((q) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(q.question),
                        ...q.answers.map((a) {
                          return ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: q.answers.indexOf(a) ==
                                        q.answerIndex
                                    ? Colors.green
                                    : q.answers.indexOf(a) ==
                                            answersIndex[questions.indexOf(q)]
                                        ? Colors.red
                                        : Colors.blueAccent,
                              ),
                              child: Text(a));
                        }),
                        const SizedBox(
                          height: 26,
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
