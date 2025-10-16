/// Model class for skill data
class Skill {
  final String id;
  final String name;
  final String description;
  final SkillLevel level;
  final SkillCategory category;
  final String? icon;
  final String? color;
  final double? proficiency; // 0.0 to 1.0
  final int? yearsOfExperience;
  final List<String> projects;
  final List<String> certifications;
  final bool isFeatured;

  const Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.category,
    this.icon,
    this.color,
    this.proficiency,
    this.yearsOfExperience,
    this.projects = const [],
    this.certifications = const [],
    this.isFeatured = false,
  });

  /// Create a copy of the skill with updated fields
  Skill copyWith({
    String? id,
    String? name,
    String? description,
    SkillLevel? level,
    SkillCategory? category,
    String? icon,
    String? color,
    double? proficiency,
    int? yearsOfExperience,
    List<String>? projects,
    List<String>? certifications,
    bool? isFeatured,
  }) {
    return Skill(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      level: level ?? this.level,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      proficiency: proficiency ?? this.proficiency,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      projects: projects ?? this.projects,
      certifications: certifications ?? this.certifications,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }

  /// Convert skill to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'level': level.toString().split('.').last,
      'category': category.toString().split('.').last,
      'icon': icon,
      'color': color,
      'proficiency': proficiency,
      'yearsOfExperience': yearsOfExperience,
      'projects': projects,
      'certifications': certifications,
      'isFeatured': isFeatured,
    };
  }

  /// Create skill from JSON
  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      level: SkillLevel.values.firstWhere(
        (e) => e.toString().split('.').last == json['level'],
      ),
      category: SkillCategory.values.firstWhere(
        (e) => e.toString().split('.').last == json['category'],
      ),
      icon: json['icon'] as String?,
      color: json['color'] as String?,
      proficiency: json['proficiency'] as double?,
      yearsOfExperience: json['yearsOfExperience'] as int?,
      projects: List<String>.from(json['projects'] as List? ?? []),
      certifications: List<String>.from(json['certifications'] as List? ?? []),
      isFeatured: json['isFeatured'] as bool? ?? false,
    );
  }

  @override
  String toString() {
    return 'Skill(id: $id, name: $name, level: $level, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Skill && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Enum for skill levels
enum SkillLevel { beginner, intermediate, advanced, expert }

/// Extension for skill level
extension SkillLevelExtension on SkillLevel {
  String get displayName {
    switch (this) {
      case SkillLevel.beginner:
        return 'Beginner';
      case SkillLevel.intermediate:
        return 'Intermediate';
      case SkillLevel.advanced:
        return 'Advanced';
      case SkillLevel.expert:
        return 'Expert';
    }
  }

  double get proficiencyValue {
    switch (this) {
      case SkillLevel.beginner:
        return 0.25;
      case SkillLevel.intermediate:
        return 0.5;
      case SkillLevel.advanced:
        return 0.75;
      case SkillLevel.expert:
        return 1.0;
    }
  }

  String get color {
    switch (this) {
      case SkillLevel.beginner:
        return '#EF5350'; // Red
      case SkillLevel.intermediate:
        return '#FFA726'; // Orange
      case SkillLevel.advanced:
        return '#42A5F5'; // Blue
      case SkillLevel.expert:
        return '#66BB6A'; // Green
    }
  }
}

/// Enum for skill categories
enum SkillCategory {
  frontend,
  backend,
  mobile,
  database,
  devops,
  tools,
  design,
  testing,
  other,
}

/// Extension for skill category
extension SkillCategoryExtension on SkillCategory {
  String get displayName {
    switch (this) {
      case SkillCategory.frontend:
        return 'Frontend';
      case SkillCategory.backend:
        return 'Backend';
      case SkillCategory.mobile:
        return 'Mobile';
      case SkillCategory.database:
        return 'Database';
      case SkillCategory.devops:
        return 'DevOps';
      case SkillCategory.tools:
        return 'Tools';
      case SkillCategory.design:
        return 'Design';
      case SkillCategory.testing:
        return 'Testing';
      case SkillCategory.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case SkillCategory.frontend:
        return '🎨';
      case SkillCategory.backend:
        return '⚙️';
      case SkillCategory.mobile:
        return '📱';
      case SkillCategory.database:
        return '🗄️';
      case SkillCategory.devops:
        return '🚀';
      case SkillCategory.tools:
        return '🔧';
      case SkillCategory.design:
        return '✏️';
      case SkillCategory.testing:
        return '🧪';
      case SkillCategory.other:
        return '📦';
    }
  }

  String get color {
    switch (this) {
      case SkillCategory.frontend:
        return '#E91E63'; // Pink
      case SkillCategory.backend:
        return '#673AB7'; // Deep Purple
      case SkillCategory.mobile:
        return '#2196F3'; // Blue
      case SkillCategory.database:
        return '#4CAF50'; // Green
      case SkillCategory.devops:
        return '#FF9800'; // Orange
      case SkillCategory.tools:
        return '#795548'; // Brown
      case SkillCategory.design:
        return '#9C27B0'; // Purple
      case SkillCategory.testing:
        return '#607D8B'; // Blue Grey
      case SkillCategory.other:
        return '#9E9E9E'; // Grey
    }
  }
}
