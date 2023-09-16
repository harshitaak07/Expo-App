import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:google_fonts/google_fonts.dart';

class Startscreen extends StatelessWidget {
  Startscreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/codex.jpg',
            width: 300,
            height: 300,
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'CODEX QUIZ \n Lets get started with it',
            textAlign: TextAlign.center,
            style: GoogleFonts.museoModerno(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: startQuiz,
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0xFFF5753B)),
            ),
            child: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
