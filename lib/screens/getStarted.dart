import 'package:flutter/material.dart';
import 'package:self_verse/dataBase/start.dart';
import 'package:self_verse/screens/home.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetstartedState();
}

class _GetstartedState extends State<GetStarted> {
  Start start = Start();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Started'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Self Verse!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                start.getStarted();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
                
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}