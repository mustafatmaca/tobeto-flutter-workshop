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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final item = questions[index];

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(item.question),
                        ...item.answers.map((a) {
                          return ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    item.answers.indexOf(a) == item.answerIndex
                                        ? Colors.green
                                        : item.answers.indexOf(a) ==
                                                answersIndex[
                                                    questions.indexOf(item)]
                                            ? Colors.red
                                            : Colors.blueAccent,
                              ),
                              child: Text(a));
                        }),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
