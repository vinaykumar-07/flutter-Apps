import 'package:brand_assignment/Quiz_App/data/question_summary.dart';
import 'package:brand_assignment/Quiz_App/data/quistion.dart';
import 'package:brand_assignment/widgets/big_text.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final void Function() onRestart;
  final List<String> chossenAnswer;
  const ResultScreen(
    this.onRestart, {
    super.key,
    required this.chossenAnswer,
  });
//method for Storing Question data in the Summary List
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chossenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': chossenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numTotalQuestion = questions.length;
    final correctQuestion = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    final resultPercent = ((correctQuestion / numTotalQuestion) * 100).toInt();

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigText(
            text:
                'You answered $correctQuestion out of $numTotalQuestion questions correctly! ($resultPercent%)',
            size: 22,
            color: Colors.white,
          ),
          const SizedBox(height: 30),
          QuestionsSummary(getSummaryData()),
          const SizedBox(height: 30),
          TextButton.icon(
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              onPressed: () {
                onRestart();
              },
              label: const BigText(
                text: "Restart quiz",
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
