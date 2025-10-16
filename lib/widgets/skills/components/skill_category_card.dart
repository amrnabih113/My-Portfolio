import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../models/skill_models.dart';
import 'skill_icon.dart';
import 'skill_text.dart';

/// Individual skill category card with animations
class SkillCategoryCard extends StatefulWidget {
  final SkillCategoryModel category;
  final Duration delay;

  const SkillCategoryCard({
    super.key,
    required this.category,
    required this.delay,
  });

  @override
  State<SkillCategoryCard> createState() => _SkillCategoryCardState();
}

class _SkillCategoryCardState extends State<SkillCategoryCard>
    with TickerProviderStateMixin {
  late AnimationController _entryController;
  late AnimationController _hoverController;

  late Animation<double> _entryAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _entryAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _entryController, curve: Curves.easeOutCubic),
    );

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );

    // Start entry animation after delay
    Future.delayed(widget.delay, () {
      if (mounted) _entryController.forward();
    });
  }

  @override
  void dispose() {
    _entryController.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_entryAnimation, _scaleAnimation]),
      builder: (context, child) {
        // Clamp animation values to prevent overflow  
        double entryValue = _entryAnimation.value.clamp(0.0, 1.0);
        double scaleValue = (_entryAnimation.value * _scaleAnimation.value).clamp(0.5, 1.1);
        
        return Transform.scale(
          scale: scaleValue,
          child: Opacity(
            opacity: entryValue,
            child: MouseRegion(
              onEnter: (_) => _hoverController.forward(),
              onExit: (_) => _hoverController.reverse(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.surfaceDark.withOpacity(0.8),
                      AppColors.backgroundDark.withOpacity(0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category title
                    Text(
                      widget.category.title,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: Responsive.getResponsiveFontSize(
                          context,
                          mobile: 20,
                          tablet: 22,
                          desktop: 24,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Skills grid
                    widget.category.title == 'Architecture Patterns'
                        ? _buildTextSkills(widget.category.skills)
                        : _buildIconSkills(widget.category.skills),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIconSkills(List<SkillModel> skills) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: skills.map((skill) => SkillIcon(skill: skill)).toList(),
    );
  }

  Widget _buildTextSkills(List<SkillModel> skills) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: skills.map((skill) => SkillText(skill: skill)).toList(),
    );
  }
}
