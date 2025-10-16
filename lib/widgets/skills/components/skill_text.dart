import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../models/skill_models.dart';

/// Text-based skill widget for architecture patterns
class SkillText extends StatelessWidget {
  final SkillModel skill;

  const SkillText({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white.withOpacity(0.2), width: 1),
      ),
      child: Text(
        skill.name,
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
