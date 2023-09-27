import 'package:flutter/material.dart';

class ElButton extends StatelessWidget {
  const ElButton({super.key, required this.anstext, required this.ontap});

  final String anstext;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color(0xFFFF7A01),
          foregroundColor: const Color(0xFFFFFFFF),
          shadowColor: const Color(0xFFD34B20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Text(
        anstext,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      ),
    );
  }
}
