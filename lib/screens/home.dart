import 'package:flutter/material.dart';
import 'package:self_verse/widgets/home/appbar.dart';
import 'package:self_verse/widgets/home/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeAppBar(),
      ),
      body: HomeBody(),
    );
  }
}