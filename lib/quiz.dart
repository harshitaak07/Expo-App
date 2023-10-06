import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/quesdata.dart';
import 'package:quiz_app/failscreen.dart';
import 'package:quiz_app/qrresultscreen.dart';
import 'package:quiz_app/restartcontrol.dart';
import 'package:quiz_app/scanner.dart';
import 'package:quiz_app/startscreen.dart';

var active = 'start-screen';
String qrC = 'Unknown';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  void switchScreen() {
    setState(() {
      active = 'question-screen';
    });
  }

  void restart() {
    setState(() {
      active = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget Screen = Startscreen(switchScreen);

    if (active == 'question-screen') {
      Screen = qrquesscreen();
    }

    if (active == 'results-screen') {
      Screen = Correct(restart: restart);
    }

    if (active == 'fail-screen') {
      Screen = failscreen(restart: restart);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFF4EA),
          ),
          child: Screen,
        ),
      ),
    );
  }
}

class qrquesscreen extends StatefulWidget {
  const qrquesscreen({super.key});

  @override
  State<qrquesscreen> createState() => _qrquesscreenState();
}

class _qrquesscreenState extends State<qrquesscreen> {
  var currentqindex = Random().nextInt(5);
  //var currentqindex = 0;

  void check(String qrans) {
    setState(() {
      if (qrans == ansdata[currentqindex]) {
        active = 'results-screen';
      } else {
        active = 'fail-screen';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = quesdata[currentqindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              current,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => scanQRCode(),
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xFFFF7A01)),
                  shadowColor:
                      MaterialStatePropertyAll<Color>(Color(0xFFD34B20))),
              child: const Text('Click'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        qrC = qrCode;
        check(qrC);
        HotRestartController.performHotRestart(context);
      });
    } on PlatformException {
      qrC = 'Failed to get platform version.';
    }
  }
}
