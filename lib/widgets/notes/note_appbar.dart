import 'package:flutter/material.dart';

class NoteAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NoteAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          onPressed: () {},
        ),
      ],
    );
  }
}