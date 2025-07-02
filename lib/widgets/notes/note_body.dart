import 'package:flutter/material.dart';
import 'package:self_verse/widgets/background/home_background.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Stack(
          children: [
            const HomeBackground(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
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
      );
  }
}