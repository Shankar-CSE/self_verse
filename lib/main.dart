import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:self_verse/screens/getStarted.dart';
import 'package:self_verse/screens/home.dart';

// Entry point of the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter bindings are initialized
  await Hive.initFlutter(); // Initializes Hive for Flutter
  await Hive.openBox('getStartedBox'); // Opens a Hive box for persistent storage

  runApp(const MyApp()); // Runs the main app widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mybox = Hive.box("getStartedBox"); // Access the opened Hive box
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self verse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Show GetStarted screen if "started" key is not set, otherwise show Home
      home: mybox.get("started") == null
          ? const GetStarted()
          : const Home(),
    );
  }
}