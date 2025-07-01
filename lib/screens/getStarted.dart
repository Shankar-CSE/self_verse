import 'package:flutter/material.dart';
// Importing the custom widget for the get started screen state
import '../widgets/getStart/get_started_state.dart';

/// The main GetStarted screen widget.
/// This is a stateless widget that displays the GetStartedState widget.
class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a Scaffold with the GetStartedState as its body
    return const Scaffold(
      body: GetStartedState(),
    );
  }
}