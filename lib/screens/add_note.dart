import 'package:flutter/material.dart';
import 'package:self_verse/database/note_list.dart';
import 'package:self_verse/widgets/background/home_background.dart';

class AddNote extends StatefulWidget {
  final NoteList noteList;
  const AddNote({super.key, required this.noteList});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Back',
          splashRadius: 28,
        ),
        title: const Text(
          'Add Note',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: const Color(0xFF8338EC),
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white, size: 40),
            onPressed: () {
              if (_titleController.text.trim().isNotEmpty) {
                widget.noteList.addNote(
                  _titleController.text.trim(),
                  _contentController.text.trim(),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Stack(
          children: [
            const HomeBackground(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  autofocus: true,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: const TextStyle(
                        color: Colors.black54, 
                        fontSize: 25, 
                        fontWeight: FontWeight.w500),
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _contentController,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: 'Write your note here...',
                      hintStyle: const TextStyle(
                          color: Colors.black54, 
                          fontSize: 20, 
                          fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}