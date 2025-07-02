import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteList extends ChangeNotifier {
  static const String _boxName = 'notesBox';
  static const String _notesKey = 'notes';

  late final Box _notesBox;
  List<Map<String, String>> _notes = [];
  bool _isInitialized = false;
  bool _isLoading = false;

  NoteList() {
    _initHive();
  }

  Future<void> _initHive() async {
    if (_isInitialized || _isLoading) return;
    _isLoading = true;

    try {
      _notesBox = await Hive.openBox(_boxName);
      await _loadNotes();
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      print('Error initializing Hive: $e');
      // Consider adding retry logic here if needed
    } finally {
      _isLoading = false;
    }
  }

  Future<void> _loadNotes() async {
    try {
      final storedNotes = _notesBox.get(_notesKey);
      if (storedNotes != null && storedNotes is List) {
        _notes = (storedNotes as List).map<Map<String, String>>((dynamic item) {
          final map = Map<String, String>.from(item as Map);
          return {
            'title': map['title'] ?? '',
            'content': map['content'] ?? '',
          };
        }).toList();
        print('Loaded ${_notes.length} notes from storage');
      }
    } catch (e) {
      print('Error loading notes: $e');
      _notes = [];
    }
  }

  List<Map<String, String>> get notes {
    if (!_isInitialized) return [];
    return List.unmodifiable(_notes);
  }

  Future<void> addNote(String title, String content) async {
    if (!_isInitialized) await _initHive();
    
    _notes.add({
      'title': title.trim(),
      'content': content.trim(),
    });
    await _saveNotes();
    notifyListeners();
  }

  Future<void> deleteNote(int index) async {
    if (!_isInitialized) await _initHive();
    if (index < 0 || index >= _notes.length) return;
    
    _notes.removeAt(index);
    await _saveNotes();
    notifyListeners();
  }

  Future<void> updateNote(int index, String newTitle, String newContent) async {
    if (!_isInitialized) await _initHive();
    if (index < 0 || index >= _notes.length) return;
    
    _notes[index] = {
      'title': newTitle.trim(),
      'content': newContent.trim(),
    };
    await _saveNotes();
    notifyListeners();
  }

  Future<void> _saveNotes() async {
    try {
      await _notesBox.put(_notesKey, _notes);
      print('Saved ${_notes.length} notes successfully');
    } catch (e) {
      print('Error saving notes: $e');
      // Consider adding retry logic or error handling UI
    }
  }

  Future<void> clearAllNotes() async {
    _notes.clear();
    await _notesBox.clear();
    notifyListeners();
  }
}