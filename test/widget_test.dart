// Basic Flutter widget test for Self Verse app.
//
// This is a smoke test to verify the app builds and displays expected widgets.

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:self_verse/main.dart';

void main() {
  setUpAll(() async {
    // Initialize Hive for testing
    await Hive.initFlutter();
  });

  testWidgets('App smoke test - renders without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify the app renders (either GetStarted or Home screen)
    // The app should display without throwing exceptions
    expect(tester.takeException(), isNull);
  });
}
