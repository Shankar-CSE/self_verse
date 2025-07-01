import 'package:flutter/material.dart';
import 'package:self_verse/widgets/home/appbar.dart';
import 'package:self_verse/widgets/home/home_body.dart';

/// The main Home screen widget of the app.
/// 
/// Displays a custom app bar and the main body content.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Builds the main scaffold for the Home screen.
    return Scaffold(
      // Custom app bar widget for the Home screen.
      appBar: const HomeAppBar(),
      
      // Main content of the Home screen.
      body: HomeBody(),
    );
  }
}