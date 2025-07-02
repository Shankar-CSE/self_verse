import 'package:flutter/foundation.dart';

class NoteList extends ChangeNotifier {
  List<Map<String, dynamic>> notes = [
   
  ];

  void addNote(String title, String content) {
    notes.add({"title": title, "content": content});
    notifyListeners(); // Notify all listeners about the change
  }

  void deleteNote(int index) {
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
      notifyListeners(); // Notify all listeners about the change
    }
  }
}