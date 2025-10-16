import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Typewriter effect for "Hello There!" greeting
class HeroTypewriterGreeting extends StatefulWidget {
  const HeroTypewriterGreeting({super.key});

  @override
  State<HeroTypewriterGreeting> createState() => _HeroTypewriterGreetingState();
}

class _HeroTypewriterGreetingState extends State<HeroTypewriterGreeting>
    with SingleTickerProviderStateMixin {
  late AnimationController _typewriterController;
  late Animation<int> _typewriterAnimation;
  final String _fullText = 'Hello There!';

  @override
  void initState() {
    super.initState();

    // Typewriter animation for "Hello There!"
    _typewriterController = AnimationController(
      duration: Duration(milliseconds: _fullText.length * 100),
      vsync: this,
    );
    _typewriterAnimation = IntTween(begin: 0, end: _fullText.length).animate(
      CurvedAnimation(parent: _typewriterController, curve: Curves.easeInOut),
    );

    // Start animation with delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _typewriterController.forward();
    });
  }

  @override
  void dispose() {
    _typewriterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _typewriterAnimation,
      builder: (context, child) {
        int currentIndex = _typewriterAnimation.value.clamp(
          0,
          _fullText.length,
        );
        String visibleText = _fullText.substring(0, currentIndex);
        return Text(
          visibleText + (currentIndex < _fullText.length ? '|' : ''),
          style: AppTextStyles.h3.copyWith(
            color: AppColors.secondary,
            fontSize: Responsive.getResponsiveFontSize(
              context,
              mobile: 24,
              tablet: 28,
              desktop: 32,
            ),
            fontWeight: FontWeight.w600,
          ),
          textAlign: Responsive.isMobile(context)
              ? TextAlign.center
              : TextAlign.start,
        );
      },
    );
  }
}
