import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Main description with slide animation
class HeroMainDescription extends StatelessWidget {
  const HeroMainDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1200),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: Text(
              'Welcome to my portfolio, dive deep into a world of design, creativity, and Flutter-powered development.',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.white.withOpacity(0.9),
                fontSize: Responsive.getResponsiveFontSize(
                  context,
                  mobile: 16,
                  tablet: 18,
                  desktop: 20,
                ),
                height: 1.6,
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
