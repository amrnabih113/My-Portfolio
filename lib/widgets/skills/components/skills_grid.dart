import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../models/skill_models.dart';
import '../data/skills_data.dart';
import 'skill_category_card.dart';

/// Skills grid widget that arranges skill categories responsively
class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = SkillsData.getSkillCategories();

    return Responsive.isMobile(context)
        ? _buildMobileLayout(categories)
        : _buildDesktopLayout(categories);
  }

  Widget _buildMobileLayout(List<SkillCategoryModel> categories) {
    return Column(
      children: categories.asMap().entries.map((entry) {
        int index = entry.key;
        SkillCategoryModel category = entry.value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: SkillCategoryCard(
            category: category,
            delay: Duration(milliseconds: 300 * index),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDesktopLayout(List<SkillCategoryModel> categories) {
    return Column(
      children: [
        // First row - Programming Languages and Frameworks & Tools
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SkillCategoryCard(
                category: categories[0],
                delay: const Duration(milliseconds: 0),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: SkillCategoryCard(
                category: categories[1],
                delay: const Duration(milliseconds: 200),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Second row - State Management and Architecture Patterns
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SkillCategoryCard(
                category: categories[2],
                delay: const Duration(milliseconds: 400),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: SkillCategoryCard(
                category: categories[3],
                delay: const Duration(milliseconds: 600),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
