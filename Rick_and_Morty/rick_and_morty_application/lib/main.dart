import 'package:flutter/material.dart';
import 'package:rick_and_morty_application/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF607D8B, // Couleur principale en format ARGB (Alpha-Rouge-Vert-Bleu)
          <int, Color>{
            50: Color(0xFFECEFF1),
            100: Color(0xFFCFD8DC),
            200: Color(0xFFB0BEC5),
            300: Color(0xFF90A4AE),
            400: Color(0xFF78909C),
            500: Color(0xFF607D8B),
            600: Color(0xFF546E7A),
            700: Color(0xFF455A64),
            800: Color(0xFF37474F),
            900: Color(0xFF263238),
          },
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
