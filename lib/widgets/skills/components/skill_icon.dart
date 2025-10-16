import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../models/skill_models.dart';
import '../utils/skill_icon_utils.dart';
import '../utils/skill_asset_utils.dart';

/// Individual skill icon widget with hybrid loading system
class SkillIcon extends StatelessWidget {
  final SkillModel skill;

  const SkillIcon({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.white.withOpacity(0.1), width: 1),
      ),
      child: Center(child: _buildSkillIcon(context)),
    );
  }

  Widget _buildSkillIcon(BuildContext context) {
    final String assetPath = SkillAssetUtils.getAssetPath(skill.name);

    return FutureBuilder<bool>(
      future: SkillAssetUtils.checkAssetExists(context, assetPath),
      builder: (context, snapshot) {
        bool assetExists = snapshot.data ?? false;

        if (assetExists) {
          // Use local asset image
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              assetPath,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return _buildNetworkOrIconFallback();
              },
            ),
          );
        } else {
          // Try network image or fallback to icon
          return _buildNetworkOrIconFallback();
        }
      },
    );
  }

  Widget _buildNetworkOrIconFallback() {
    final String? networkUrl = skill.imageUrl;

    if (networkUrl != null && networkUrl.isNotEmpty) {
      // Try network image
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          networkUrl,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
          headers: const {
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
          },
          errorBuilder: (context, error, stackTrace) {
            return _buildMaterialIconFallback();
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    SkillIconUtils.getSkillColor(skill.name),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      // Use Material Icon
      return _buildMaterialIconFallback();
    }
  }

  Widget _buildMaterialIconFallback() {
    final IconData skillIcon = SkillIconUtils.getSkillIcon(skill.name);
    final Color skillColor = SkillIconUtils.getSkillColor(skill.name);

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: skillColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: skillColor.withOpacity(0.3), width: 1),
      ),
      child: Icon(skillIcon, color: skillColor, size: 24),
    );
  }
}
