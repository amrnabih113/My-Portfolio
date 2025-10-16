import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import 'about_highlight_card.dart';

/// Model class for highlight items
class HighlightModel {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const HighlightModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

/// About highlights widget with cards and icons
class AboutHighlights extends StatelessWidget {
  const AboutHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    final highlights = [
      HighlightModel(
        icon: Icons.timeline_rounded,
        title: '2+ Years Experience',
        description: 'Flutter development expertise',
        color: AppColors.primary,
      ),
      HighlightModel(
        icon: Icons.code_rounded,
        title: 'Dart Programming',
        description: 'Expert in mobile app architecture',
        color: AppColors.secondary,
      ),
      HighlightModel(
        icon: Icons.design_services_rounded,
        title: 'UI/UX Design',
        description: 'Strong focus on user experience',
        color: AppColors.accent,
      ),
      HighlightModel(
        icon: Icons.speed_rounded,
        title: 'Performance Focus',
        description: 'Optimization and clean code practices',
        color: AppColors.primary,
      ),
      HighlightModel(
        icon: Icons.school_rounded,
        title: 'Continuous Learning',
        description: 'Staying updated with latest technologies',
        color: AppColors.secondary,
      ),
    ];

    return Container(
      width: double.infinity,
      child: Responsive.isMobile(context)
          ? _buildMobileLayout(highlights)
          : Responsive.isTablet(context)
          ? _buildTabletLayout(highlights)
          : _buildDesktopLayout(highlights),
    );
  }

  Widget _buildMobileLayout(List<HighlightModel> highlights) {
    return Column(
      children: highlights.map((highlight) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AboutHighlightCard(highlight: highlight),
        );
      }).toList(),
    );
  }

  Widget _buildTabletLayout(List<HighlightModel> highlights) {
    return Column(
      children: [
        // First row - 2 cards
        Row(
          children: highlights.take(2).map((highlight) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AboutHighlightCard(highlight: highlight),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        // Second row - 2 cards
        Row(
          children: highlights.skip(2).take(2).map((highlight) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AboutHighlightCard(highlight: highlight),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        // Third row - 1 card centered
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AboutHighlightCard(highlight: highlights.last),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(List<HighlightModel> highlights) {
    return Column(
      children: [
        // First row - 3 cards
        Row(
          children: highlights.take(3).map((highlight) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: AboutHighlightCard(highlight: highlight),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        // Second row - 2 cards centered with flexible width
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: highlights.skip(3).map((highlight) {
            return Flexible(
              flex: 1,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 280),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: AboutHighlightCard(highlight: highlight),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
