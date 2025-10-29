import 'package:flutter/material.dart';
import 'home_screen.dart'; // Importa a tela principal

void main() {
  runApp(const CombinedExercisesApp());
}

class CombinedExercisesApp extends StatelessWidget {
  const CombinedExercisesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercícios Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(), // A tela principal com o menu
    );
  }
}