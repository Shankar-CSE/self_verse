import 'package:flutter/material.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Self Verse'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Navigate to settings page
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
    );
  }
}

