import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class failscreen extends StatelessWidget {
  const failscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 80,
          ),
          SvgPicture.asset('assets/images/Owl-8-1.svg',width: 100, height: 100,),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Nay',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500,),
          ),
        ],
        ),
      );
  }
}
