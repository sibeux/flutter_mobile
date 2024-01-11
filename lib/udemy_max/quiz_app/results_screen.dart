import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/quiz_app/data/questions.dart';
import 'package:flutter_mobile/udemy_max/quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final summaryData = <Map<String, Object>>[];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'Correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('You answered X out of Y questions correctly!'),
          const SizedBox(height: 30),
          QuestionsSummary(getSummaryData()),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: const Text('restart quiz'),
          )
        ]),
      ),
    );
  }
}
