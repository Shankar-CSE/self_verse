import 'package:flutter/material.dart';
import 'package:self_verse/widgets/notes/note_appbar.dart';
import 'package:self_verse/widgets/notes/note_body.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppbar() ,
      body: NoteBody(),
    );
  }
}
