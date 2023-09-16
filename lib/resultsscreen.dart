import 'package:flutter/material.dart';
import 'package:quiz_app/data/quesdata.dart';
import 'package:quiz_app/ques_summary.dart';

class Results extends StatelessWidget {
  const Results({
    super.key,
    required this.chosen,
    required this.restart,
  });

  final void Function() restart;
  final List<String> chosen;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosen.length; i++) {
      summary.add({
        'question_index': i,
        'question': quesdata[i].text,
        'correct_answer': quesdata[i].answers[0],
        'user_answer': chosen[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummary();
    final totques = quesdata.length;
    final numcorr = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'You answered $numcorr out of $totques questions correctly!\n',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFFF5753B),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              'Now Register Below !',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Image.asset('assets/images/codexqr.jpg'),
            ),
            TextButton.icon(
              onPressed: restart,
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Color(0xFFF5753B), fontSize: 15),
              ),
              icon: const Icon(
                Icons.restart_alt,
                color: Color(0xFFF5753B),
              ),
            )
          ],
        ),
      ),
    );
  }
}
