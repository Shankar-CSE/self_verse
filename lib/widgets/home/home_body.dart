import 'package:flutter/material.dart';
import 'package:self_verse/database/note_list.dart';
import 'package:self_verse/widgets/background/home_background.dart';
import 'package:self_verse/widgets/notes/note_style.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with SingleTickerProviderStateMixin {

 

@override
Widget build(BuildContext context) {
  NoteList noteList = NoteList();
  return Container(
    decoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    child: Stack(
      children: [
        const HomeBackground(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: noteList.getNotes().length,
                  itemBuilder: (context, index) {
                    final note = noteList.getNotes()[index];
                    return NoteStyle(
                      note: note,
                      onDelete: () {
                        setState(() {
                          noteList.deleteNote(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ]
          ),
        ),
      ],
    ),
  );
}
}