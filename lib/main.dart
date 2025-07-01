import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:self_verse/screens/getStarted.dart';
import 'package:self_verse/screens/home.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Open a box for storing data
  await Hive.openBox('getStartedBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mybox = Hive.box("getStartedBox");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self verse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mybox.get("started") == null
          ? const GetStarted()
          : const Home(),
    );
  }
}