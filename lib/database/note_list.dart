import 'package:flutter/material.dart';

class NoteList {
List <Map<String, dynamic>> notes = [
    {"title": "Note 1", "content": "This is the content of note 1"},
    {"title": "Note 2", "content": "This is the content of note 2"},
    {"title": "Note 3", "content": "This is the content of note 3"},
];
  // Method to add a new note
  void addNote(String title, String content) {
    notes.add({"title": title, "content": content});
  }

  // Method to get all notes
  List<Map<String, dynamic>> getNotes() {
    return notes;
  }

  // Method to delete a note by index
  void deleteNote(int index) {
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
    }
  }

}