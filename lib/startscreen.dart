import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';


class Startscreen extends StatelessWidget {
  Startscreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/images/Owl-8-1.svg',width: 150, height: 150,),
          const SizedBox(
            height: 30,
          ),
          Text(
            'the cryptic hunt 2.0',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Experience the hunt!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: startQuiz,
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0xFFFF7A01)),
              shadowColor: 
              MaterialStatePropertyAll<Color>(Color(0xFFD34B20))
            ),
            child: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}