import 'package:flutter/material.dart';
import 'package:self_verse/database/note_list.dart';
import 'package:self_verse/widgets/background/home_background.dart';
import 'package:self_verse/widgets/notes/note_appbar.dart';
import 'package:self_verse/widgets/notes/note_body.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
 NoteList noteList = NoteList();
  // Removed late NoteList noteList;

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
        if (titleController.text.isNotEmpty || contentController.text.isNotEmpty) {
          setState(() {
             noteList.addNote(titleController.text, contentController.text);
          });
         
          Navigator.of(context).pop(true); // Pass true to indicate update
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Note saved successfully!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Title or content cannot be empty')),
          );
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
                  controller: titleController,
                  autofocus: true,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: const TextStyle(color: Colors.black54, fontSize: 25, fontWeight: FontWeight.w500),
                    border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
                TextField(
                  controller: contentController,
                  autofocus: true,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Write your note here...',
                    hintStyle: const TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
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
