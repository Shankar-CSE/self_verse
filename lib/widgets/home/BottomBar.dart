import 'package:flutter/material.dart';
import 'package:self_verse/database/note_list.dart';
import 'package:self_verse/screens/add_note.dart';
import 'package:self_verse/screens/home.dart';

class BottomBar extends StatefulWidget {
  final NoteList noteList;
  const BottomBar({super.key, required this.noteList});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF8338EC),
            Color(0xFF3A86FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2, 0.8],
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          
          if (index == 1) {
            // Navigate to Add Note screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNote(noteList: widget.noteList),
              ),
            );
          }
          // Other tabs can be handled here
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: Colors.black,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30.0,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}