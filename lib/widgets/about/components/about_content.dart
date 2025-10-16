import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import 'about_highlights.dart';

/// Main about content with description and highlights
class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Introduction
        Text(
          'Crafting Tomorrow\'s Mobile Experiences',
          style: AppTextStyles.h4.copyWith(
            color: AppColors.primary,
            fontSize: Responsive.getResponsiveFontSize(
              context,
              mobile: 20,
              tablet: 24,
              desktop: 28,
            ),
            fontWeight: FontWeight.w600,
          ),
          textAlign: Responsive.isMobile(context)
              ? TextAlign.center
              : TextAlign.start,
        ),

        const SizedBox(height: 24),

        // Main description
        Text(
          'I specialize in transforming innovative concepts into tangible, scalable, and visually appealing mobile applications. My expertise lies in leveraging Flutter, Firebase, and Supabase, and APIs, to deliver seamless functionality and exceptional user experiences. I focus on transforming ideas into polished digital products that balance clean architecture, performance, and engaging design.',
          style: AppTextStyles.bodyLarge.copyWith(
            height: 1.7,
            color: AppColors.textLight,
            fontSize: Responsive.getResponsiveFontSize(
              context,
              mobile: 16,
              tablet: 18,
              desktop: 18,
            ),
          ),
          textAlign: Responsive.isMobile(context)
              ? TextAlign.center
              : TextAlign.start,
        ),

        const SizedBox(height: 24),

        // Approach
        Text(
          'My approach: Beyond code, I engineer solutions that grow with your business needs.',
          style: AppTextStyles.bodyLarge.copyWith(
            height: 1.7,
            fontSize: Responsive.getResponsiveFontSize(
              context,
              mobile: 16,
              tablet: 18,
              desktop: 18,
            ),
            fontWeight: FontWeight.w600,
            color: AppColors.primary.withOpacity(0.9),
          ),
          textAlign: Responsive.isMobile(context)
              ? TextAlign.center
              : TextAlign.start,
        ),

        const SizedBox(height: 24),

        // Key points
        const AboutHighlights(),
      ],
    );
  }
}
