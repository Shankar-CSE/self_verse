import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation :10,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Icon(
          Icons.auto_awesome,
          size: 32,
          color: Colors.white,
        ),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Self',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 26,
                letterSpacing: 1.5,
                color: Colors.pinkAccent,
                fontFamily: 'Poppins',
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
            ),
            WidgetSpan(
              child: SizedBox(width: 4),
            ),
            TextSpan(
              text: 'Verse',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 26,
                letterSpacing: 1.5,
                color: Colors.lightBlueAccent,
                fontFamily: 'Montserrat',
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
   
      shadowColor: Colors.deepPurple.withOpacity(0.6),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF8338EC),
              const Color(0xFF3A86FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.2, 0.8],
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.5),
              blurRadius: 12,
              spreadRadius: 3,
              offset: const Offset(0, 5),
            )
          ],
        ),
      ),
      actions: [
        const SizedBox(width: 10),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
              gradient: LinearGradient(
                colors: [
                  Colors.pinkAccent,
                  const Color(0xFFFF006E),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 26),
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 15),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}