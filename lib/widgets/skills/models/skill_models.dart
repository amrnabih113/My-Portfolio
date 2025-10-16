
/// Skill category model containing title and list of skills
class SkillCategoryModel {
  final String title;
  final List<SkillModel> skills;

  const SkillCategoryModel({required this.title, required this.skills});
}

/// Individual skill model with name, optional image URL, and text flag
class SkillModel {
  final String name;
  final String? imageUrl;
  final bool isText;

  const SkillModel({required this.name, this.imageUrl, this.isText = false});
}
