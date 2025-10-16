import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Certifications section title with underline decoration
class CertificationsSectionTitle extends StatelessWidget {
  const CertificationsSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Certifications & Expertise',
          style: AppTextStyles.h2.copyWith(
            fontSize: Responsive.getResponsiveFontSize(
              context,
              mobile: 36,
              tablet: 42,
              desktop: 48,
            ),
            color: AppColors.textLight,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            gradient: AppColors.secondaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
