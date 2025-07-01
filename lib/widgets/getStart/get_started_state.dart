// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:self_verse/dataBase/start.dart';
import 'package:self_verse/screens/home.dart';
import 'package:self_verse/widgets/getStart/lists.dart';
import 'onboarding_card.dart';
import 'floating_circle.dart';

/// The main onboarding screen stateful widget.
class GetStartedState extends StatefulWidget {
  const GetStartedState({super.key});
  @override
  State<GetStartedState> createState() => _GetStartedStateState();
}

class _GetStartedStateState extends State<GetStartedState> with TickerProviderStateMixin {
  final Start start = Start(); // Database helper for onboarding state
  int _currentIndex = 0; // Current onboarding card index

  // Controller for page navigation
  late final PageController _pageController = PageController();

  // Animation controller for button and card transitions
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 800), vsync: this);

  // Scale animation for the button
  late final Animation<double> _scaleAnimation = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.1), weight: 0.5),
    TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 0.5),
  ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

  // Slide animation for the button
  late final Animation<Offset> _slideAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.2), end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  // List of onboarding card data
  final List<Map<String, dynamic>> _cards = GetStartCards().getCards();

  @override
  void initState() {
    super.initState();
    _controller.forward(); // Start the animation on load
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  /// Move to the next onboarding card or finish onboarding.
  void _nextCard() async {
    if (_currentIndex < _cards.length - 1) {
      await _pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
      setState(() => _currentIndex++);
    } else {
      // Mark onboarding as complete and navigate to Home
      start.getStarted();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => Home(),
          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  /// Skip onboarding and go directly to Home.
  void _skipToEnd() {
    start.getStarted();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Animated background gradient
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _cards[_currentIndex]['gradient'],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Decorative floating circles
          Positioned(
            top: size.height * 0.1,
            left: -30,
            child: FloatingCircle(size: 80, color: Colors.white.withOpacity(0.15)),
          ),
          Positioned(
            bottom: size.height * 0.2,
            right: -40,
            child: FloatingCircle(size: 120, color: Colors.white.withOpacity(0.1)),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                // Skip button at the top right
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8),
                    child: TextButton(
                      onPressed: _skipToEnd,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        backgroundColor: Colors.white.withAlpha((0.5 * 255).toInt()),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.black.withAlpha((0.5 * 255).toInt()),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                // Onboarding cards
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(), // Disable swipe
                    itemCount: _cards.length,
                    itemBuilder: (_, i) => OnboardingCard(
                      card: _cards[i],
                      scaleAnimation: _scaleAnimation,
                      slideAnimation: _slideAnimation,
                    ),
                  ),
                ),
                // Progress indicators and action button
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    children: [
                      // Dots indicator for progress
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_cards.length, (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentIndex == i ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentIndex == i ? Colors.white : Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        )),
                      ),
                      const SizedBox(height: 32),
                      // Animated Continue/Get Started button
                      SlideTransition(
                        position: _slideAnimation,
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: ElevatedButton(
                            onPressed: _nextCard,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: _cards[_currentIndex]['gradient'][0],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                              elevation: 6,
                              shadowColor: Colors.black.withOpacity(0.3),
                            ),
                            child: Text(
                              _currentIndex < _cards.length - 1 ? 'Continue' : 'Get Started',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
