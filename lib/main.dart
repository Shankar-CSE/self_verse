import 'package:flutter/material.dart';
import 'package:self_verse/screens/getStarted.dart';
import 'package:self_verse/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self verse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Getstarted(),
    );
  }
}