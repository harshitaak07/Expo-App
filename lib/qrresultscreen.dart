import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Correct extends StatelessWidget {
  const Correct({
    super.key,
    required this.restart,
  });

  final void Function() restart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 80,
          ),
          Image.asset(
            'assets/images/pirate.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Yay!! You are already a pro!\nRegister now !',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          ElevatedButton.icon(
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0xFFFF7A01)),
            ),
            onPressed: restart,
            label: const Text(
              'Restart Quiz!',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
