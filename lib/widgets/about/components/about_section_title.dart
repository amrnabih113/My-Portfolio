import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// About section title with underline decoration
class AboutSectionTitle extends StatelessWidget {
  const AboutSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'About Me',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.white,
            fontSize: Responsive.getResponsiveFontSize(
              context,
              mobile: 36,
              tablet: 42,
              desktop: 48,
            ),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Container(
          width: 60,
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
