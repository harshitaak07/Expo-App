import 'package:flutter/material.dart';
import 'package:quiz_app/data/quesdata.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/resultsscreen.dart';
import 'package:quiz_app/startscreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selected = [];
  var active = 'start-screen';

  void switchScreen() {
    setState(() {
      active = 'question-screen';
    });
  }

  void choices(String answer) {
    selected.add(answer);

    if (selected.length == quesdata.length) {
      setState(
        () {
          active = 'results-screen';
        },
      );
    }
  }

  void restartQuiz() {
    setState(() {
      selected = [];
      active = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget Screen = Startscreen(switchScreen);

    if (active == 'question-screen') {
      Screen = QuesScreen(onselect: choices);
    }

    if (active == 'results-screen') {
      Screen = Results(
        chosen: selected,
        restart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 29, 29, 29)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Screen,
        ),
      ),
    );
  }
}
