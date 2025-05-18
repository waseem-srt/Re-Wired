import 'package:flutter/material.dart';
import 'intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Re-Wires',
      theme: ThemeData(
        primaryColor: const Color(0xFF87CEEB),
        scaffoldBackgroundColor: const Color(0xFFE0F4F7),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF87CEEB)),
        useMaterial3: true,
      ),
      home: IntroPage(),
    );
  }
}
