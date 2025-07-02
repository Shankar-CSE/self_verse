import 'package:flutter/material.dart';
import 'package:self_verse/database/note_list.dart';
import 'package:self_verse/widgets/home/BottomBar.dart';
import 'package:self_verse/widgets/home/appbar.dart';
import 'package:self_verse/widgets/home/home_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  late NoteList noteList;
  
  @override
  void initState() {
    super.initState();
    noteList = NoteList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: HomeBody(noteList: noteList),
      bottomNavigationBar: BottomBar(noteList: noteList),
    );
  }
}