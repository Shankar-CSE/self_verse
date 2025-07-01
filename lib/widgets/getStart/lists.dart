import 'package:flutter/material.dart';

/// A class that provides a list of card data for the Get Started section.
class GetStartCards {
  // List of card data, each represented as a map with icon, title, subtitle, color, and gradient.
  final List<Map<String, dynamic>> _cards = [
    {
      'icon': Icons.self_improvement,
      'title': 'Welcome to Self Verse',
      'subtitle': 'Your journey to self-discovery starts here',
      'color': Color(0xFF6A67CE), // Purple
      'gradient': [Color(0xFF6A67CE), Color(0xFF89D4CF)],
    },
    {
      'icon': Icons.auto_graph_rounded,
      'title': 'Track Your Progress',
      'subtitle': 'Monitor your growth and achievements',
      'color': Color(0xFF4CAF50), // Green
      'gradient': [Color(0xFF4CAF50), Color(0xFF8BC34A)],
    },
    {
      'icon': Icons.lightbulb_outline_rounded,
      'title': 'Daily Inspirations',
      'subtitle': 'Get inspired every day with new insights',
      'color': Color(0xFFFF9800), // Orange
      'gradient': [Color(0xFFFF9800), Color(0xFFFFC107)],
    },
    {
      'icon': Icons.verified_user_rounded,
      'title': 'Your Data is Safe',
      'subtitle': 'We value your privacy and security',
      'color': Color(0xFF2196F3), // Blue
      'gradient': [Color(0xFF2196F3), Color(0xFF03A9F4)],
    },
  ];

  /// Returns the list of card data.
  List<Map<String, dynamic>> getCards() {
    return _cards;
  }
}