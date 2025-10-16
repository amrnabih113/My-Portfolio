import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// "I am" subtitle with animation
class HeroSubtitle extends StatefulWidget {
  const HeroSubtitle({super.key});

  @override
  State<HeroSubtitle> createState() => _HeroSubtitleState();
}

class _HeroSubtitleState extends State<HeroSubtitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    // Start animation after typewriter delay
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - _animation.value.clamp(0.0, 1.0))),
          child: Opacity(
            opacity: _animation.value.clamp(0.0, 1.0),
            child: Text(
              'I am',
              style: AppTextStyles.h4.copyWith(
                color: AppColors.white.withOpacity(0.8),
                fontSize: Responsive.getResponsiveFontSize(
                  context,
                  mobile: 18,
                  tablet: 22,
                  desktop: 26,
                ),
                fontStyle: FontStyle.italic,
              ),
              textAlign: Responsive.isMobile(context)
                  ? TextAlign.center
                  : TextAlign.start,
            ),
          ),
        );
      },
    );
  }
}
