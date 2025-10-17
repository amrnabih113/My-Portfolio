import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import 'certification_model.dart';
import 'certification_card.dart';

/// Certifications grid widget with data
class CertificationsGrid extends StatelessWidget {
  const CertificationsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final certifications = [
      CertificationModel(
        title: 'CS50x: Introduction to Computer Science',
        provider: 'Harvard',
        year: '2024',
        description:
            'Built a foundational understanding of computer science principles, algorithms, and problem-solving techniques. Learned core concepts like data structures, memory, and computational thinking.',
        icon: Icons.computer_rounded,
        color: AppColors.primary,
        certificateUrl: 'https://drive.google.com/file/d/186msy76VWJzvxnYM_g4TQfDasLBiOtxU/view?usp=drive_link',
      ),
      CertificationModel(
        title: 'InnovEgypt Program',
        provider: 'ITIDA/TIEC',
        year: '2024',
        description:
            'Successfully completed a 45-hour training course and developed a final project for a potential startup',
        icon: Icons.lightbulb_rounded,
        color: AppColors.accent,
        certificateUrl: 'https://drive.google.com/file/d/1zCHA-gsr17Swn-dDv-rTr62L4mNVZKgy/view?usp=drive_link',
      ),
      CertificationModel(
        title: 'CS50\'s Introduction to Databases',
        provider: 'Harvard',
        year: '2025',
        description: 'Deep dive into database design and management.',
        icon: Icons.storage_rounded,
        color: AppColors.secondary,
        certificateUrl: 'https://drive.google.com/file/d/1WlOouaH8D_ur9ZO2jLKJHhD-kQWZhg9S/view?usp=drive_link',
      ),
      CertificationModel(
        title: 'Flutter Clean Architecture',
        provider: 'Udemy',
        year: '2025',
        description: 'Mastering structured and maintainable codebases',
        icon: Icons.architecture_rounded,
        color: AppColors.primary,
        certificateUrl: 'https://drive.google.com/file/d/1oRuDRlTyy-oBAWXR8zYgsirzO2Vg4mqb/view?usp=drive_link',
      ),
    ];

    return Responsive.isMobile(context)
        ? _buildMobileLayout(certifications)
        : _buildDesktopLayout(certifications);
  }

  Widget _buildMobileLayout(List<CertificationModel> certifications) {
    return Column(
      children: certifications.asMap().entries.map((entry) {
        int index = entry.key;
        CertificationModel cert = entry.value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: CertificationCard(
            certification: cert,
            delay: Duration(milliseconds: 200 * index),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDesktopLayout(List<CertificationModel> certifications) {
    return Column(
      children: [
        // First row - 2 cards
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: certifications.take(2).toList().asMap().entries.map((
            entry,
          ) {
            int index = entry.key;
            CertificationModel cert = entry.value;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CertificationCard(
                  certification: cert,
                  delay: Duration(milliseconds: 200 * index),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        // Second row - 2 cards
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: certifications.skip(2).toList().asMap().entries.map((
            entry,
          ) {
            int index = entry.key + 2;
            CertificationModel cert = entry.value;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CertificationCard(
                  certification: cert,
                  delay: Duration(milliseconds: 200 * index),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
