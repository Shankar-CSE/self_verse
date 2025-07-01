import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Welcome to Self Verse!',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            'Your journey to self-discovery begins here.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}