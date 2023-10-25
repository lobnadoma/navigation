import 'package:flutter/material.dart';
import 'package:voice_command_trial/speach_text.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: SpeachText()),
    );
  }
}
