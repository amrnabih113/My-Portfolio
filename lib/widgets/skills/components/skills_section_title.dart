import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Section title widget for skills section
class SkillsSectionTitle extends StatelessWidget {
  const SkillsSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Skills',
          style: AppTextStyles.h1.copyWith(
            fontSize: Responsive.getResponsiveFontSize(
              context,
              mobile: 48,
              tablet: 56,
              desktop: 64,
            ),
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          width: 100,
          height: 4,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
