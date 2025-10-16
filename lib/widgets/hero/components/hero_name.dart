import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Name with scale animation
class HeroName extends StatefulWidget {
  const HeroName({super.key});

  @override
  State<HeroName> createState() => _HeroNameState();
}

class _HeroNameState extends State<HeroName>
    with SingleTickerProviderStateMixin {
  late AnimationController _nameController;
  late Animation<double> _nameAnimation;

  @override
  void initState() {
    super.initState();

    _nameController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _nameAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _nameController, curve: Curves.easeOutCubic),
    );

    // Start animation after typewriter delay
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) _nameController.forward();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _nameAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _nameAnimation.value.clamp(0.0, 1.0),
          child: Opacity(
            opacity: _nameAnimation.value.clamp(0.0, 1.0),
            child: Text(
              'Amr Mohamed Nabih',
              style: AppTextStyles.h1.copyWith(
                color: AppColors.white,
                fontSize: Responsive.getResponsiveFontSize(
                  context,
                  mobile: 32,
                  tablet: 48,
                  desktop: 56,
                ),
                fontWeight: FontWeight.bold,
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
