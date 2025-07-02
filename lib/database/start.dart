import 'package:hive/hive.dart';

class Start {
  // Open the Hive box named "getStartedBox" for persistent storage
  final _mybox = Hive.box("myBox");

  // Method to handle app start logic
  void getStarted() {
    // Check if the "started" flag exists in the box (i.e., if the app has been started before)
    if (_mybox.get("started") == null) {
      // If not, set the "started" flag to true to indicate the app has started
      _mybox.put("started", true);
      // Additional logic for first-time start can be added here
    }
    // Logic to handle the start of the app (runs every time)
    print("App started");
  }
}