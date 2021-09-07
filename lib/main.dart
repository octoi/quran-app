import 'package:flutter/material.dart';
import 'package:quran/screens/home_screen.dart';

void main() {
  runApp(Quran());
}

class Quran extends StatelessWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
