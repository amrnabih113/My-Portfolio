import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Hero section description text
class HeroDescription extends StatelessWidget {
  const HeroDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Passionate Flutter developer creating beautiful, performant mobile applications. '
      'I specialize in cross-platform development with clean architecture and user-centered design.',
      style: AppTextStyles.bodyLarge.copyWith(
        fontSize: Responsive.getResponsiveFontSize(
          context,
          mobile: 16,
          tablet: 18,
          desktop: 20,
        ),
        color: AppColors.white.withOpacity(0.8),
        height: 1.6,
      ),
      textAlign: TextAlign.start,
    );
  }
}
