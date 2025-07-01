import 'package:flutter/material.dart';

/// A widget that displays an onboarding card with animated icon, title, and subtitle.
class OnboardingCard extends StatelessWidget {
  /// The card data containing icon, title, subtitle, and gradient colors.
  final Map<String, dynamic> card;

  /// Animation for scaling the icon and fading in text.
  final Animation<double> scaleAnimation;

  /// Animation for sliding the widgets into view.
  final Animation<Offset> slideAnimation;

  const OnboardingCard({
    super.key,
    required this.card,
    required this.scaleAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated icon with slide and scale transitions
          SlideTransition(
            position: slideAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      card['gradient'][0].withOpacity(0.3),
                      card['gradient'][1].withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Icon(
                    card['icon'],
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Animated title with slide and fade transitions
          SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: scaleAnimation,
              child: Text(
                card['title'],
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Animated subtitle with slide and fade transitions
          SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: scaleAnimation,
              child: Text(
                card['subtitle'],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.9),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}