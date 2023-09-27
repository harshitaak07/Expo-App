import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/restartcontrol.dart';

void main() {
  runApp(new HotRestartController(child: Quiz()));
}
