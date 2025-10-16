import 'package:flutter/material.dart';
import 'hero_buttons.dart';

/// Animated hero buttons wrapper
class HeroAnimatedButtons extends StatefulWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;

  const HeroAnimatedButtons({
    super.key,
    this.onViewWorkPressed,
    this.onContactPressed,
  });

  @override
  State<HeroAnimatedButtons> createState() => _HeroAnimatedButtonsState();
}

class _HeroAnimatedButtonsState extends State<HeroAnimatedButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOutCubic),
    );

    // Start button animation after other elements
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) _buttonController.forward();
    });
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _buttonAnimation,
      builder: (context, child) {
        double animationValue = _buttonAnimation.value.clamp(0.0, 1.0);
        return Transform.scale(
          scale: animationValue,
          child: Opacity(
            opacity: animationValue,
            child: HeroButtons(
              onViewWorkPressed: widget.onViewWorkPressed,
              onContactPressed: widget.onContactPressed,
            ),
          ),
        );
      },
    );
  }
}
