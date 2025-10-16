import 'package:flutter/material.dart';
import '../../utils/utils.dart';

/// Feature cards section widget
class FeatureCardsSection extends StatelessWidget {
  const FeatureCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.getResponsivePadding(context),
      child: Column(
        children: [
          const SizedBox(height: 48),
          Text(
            'Why Choose Me?',
            style: AppTextStyles.h3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Here are some key features that make my work stand out',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const _FeatureGrid(),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}

/// Feature grid widget
class _FeatureGrid extends StatelessWidget {
  const _FeatureGrid();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = Responsive.getCrossAxisCount(context);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: _features.length,
          itemBuilder: (context, index) {
            return _FeatureCard(feature: _features[index]);
          },
        );
      },
    );
  }

  static const List<FeatureModel> _features = [
    FeatureModel(
      icon: Icons.phone_android,
      title: 'Responsive Design',
      description: 'Works perfectly on all devices and screen sizes',
    ),
    FeatureModel(
      icon: Icons.palette,
      title: 'Modern UI',
      description: 'Beautiful and intuitive user interface design',
    ),
    FeatureModel(
      icon: Icons.speed,
      title: 'Fast Performance',
      description: 'Optimized for speed and smooth user experience',
    ),
    FeatureModel(
      icon: Icons.security,
      title: 'Secure',
      description: 'Built with security best practices in mind',
    ),
    FeatureModel(
      icon: Icons.code,
      title: 'Clean Code',
      description: 'Well-structured, maintainable, and scalable code',
    ),
    FeatureModel(
      icon: Icons.support_agent,
      title: 'Support',
      description: 'Ongoing support and maintenance available',
    ),
  ];
}

/// Individual feature card widget
class _FeatureCard extends StatelessWidget {
  final FeatureModel feature;

  const _FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(feature.icon, size: 40, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              feature.title,
              style: AppTextStyles.h6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                feature.description,
                style: AppTextStyles.bodySmall,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Feature model class
class FeatureModel {
  final IconData icon;
  final String title;
  final String description;

  const FeatureModel({
    required this.icon,
    required this.title,
    required this.description,
  });
}
