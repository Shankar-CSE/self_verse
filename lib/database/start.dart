import 'package:hive/hive.dart';

class Start {
  final _mybox = Hive.box("getStartedBox");
  void getStarted() {
    // Check if the app has been started before 
    if (_mybox.get("started") == null) {
      // If not, set the started flag to true
      _mybox.put("started", true);
      // Call the method to handle the start of the app
    }
    // Logic to handle the start of the app
    print("App started");
  }
}