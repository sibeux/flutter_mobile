import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/quiz_app/answer_button.dart';
import 'package:flutter_mobile/udemy_max/quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color : Colors.white,

              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // explain the ... operator (spread operator)
            // const number = [1, 2, 3];
            // const number2 = [number, 6]; -> [[1, 2, 3], 6]
            // const number3 = [...number, 6]; -> [1, 2, 3, 6]

            ...currentQuestion
                .getShuffledAnswers()
                .map((answer) => AnswerButton(
                      answerText: answer,
                      onPressed: answerQuestion,
                    ))
          ],
        ),
      ),
    );
  }
}
