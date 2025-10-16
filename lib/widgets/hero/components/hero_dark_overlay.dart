import 'package:flutter/material.dart';

/// Animated dark overlay with pulsing gradient
class HeroDarkOverlay extends StatefulWidget {
  const HeroDarkOverlay({super.key});

  @override
  State<HeroDarkOverlay> createState() => _HeroDarkOverlayState();
}

class _HeroDarkOverlayState extends State<HeroDarkOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 0.9).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(
                    0xFF0B1021,
                  ).withOpacity((_pulseAnimation.value * 0.5) + 0.3),
                  Color(
                    0xFF0F172A,
                  ).withOpacity((_pulseAnimation.value * 0.6) + 0.4),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
