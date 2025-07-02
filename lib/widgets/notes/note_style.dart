import 'package:flutter/material.dart';

class NoteStyle extends StatelessWidget {
  final Map<String, dynamic> note;
  final VoidCallback onDelete;

  const NoteStyle({
    super.key,
    required this.note,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.amber[50],
      child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      leading: CircleAvatar(
        backgroundColor: Colors.amber[200],
        child: Icon(Icons.note, color: Colors.brown[700]),
      ),
      title: Text(
        note['title'],
        style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.brown,
        ),
      ),
      subtitle: Text(
        note['content'],
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
        color: Colors.brown[400],
        fontSize: 15,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.redAccent),
        onPressed: onDelete,
        tooltip: 'Delete Note',
      ),
      ),
    );
  }
}