import 'package:flutter/material.dart';
import 'package:self_verse/database/note_list.dart';
import 'package:self_verse/widgets/background/home_background.dart';
import 'package:self_verse/widgets/notes/note_style.dart';

class HomeBody extends StatefulWidget {
  final NoteList noteList;
  const HomeBody({super.key, required this.noteList});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late final VoidCallback _noteListListener;

  @override
  void initState() {
    super.initState();
    // Listen to changes in noteList
    _noteListListener = () {
      if (mounted) setState(() {});
    };
    widget.noteList.addListener(_noteListListener);
  }

  @override
  void dispose() {
    widget.noteList.removeListener(_noteListListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          const HomeBackground(),
          Column(
            children: [
              widget.noteList.notes.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Text(
                          'No notes available',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.noteList.notes.length,
                  itemBuilder: (context, index) {
                    final note = widget.noteList.notes[index];
                    return NoteStyle(
                      note: note,
                      onDelete: () {
                        widget.noteList.deleteNote(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}