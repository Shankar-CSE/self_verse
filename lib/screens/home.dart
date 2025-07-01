import 'package:flutter/material.dart';
import 'package:self_verse/widgets/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Self Verse'),
        centerTitle: true,
      ),
      body: HomeBody(),
    );
  }
}