/// Model class for project data
class Project {
  final String id;
  final String title;
  final String description;
  final String shortDescription;
  final List<String> images;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final ProjectCategory category;
  final ProjectStatus status;
  final DateTime startDate;
  final DateTime? endDate;
  final bool isFeatured;
  final List<String> features;
  final String? client;
  final double? rating;
  final int? downloads;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.images,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    required this.category,
    required this.status,
    required this.startDate,
    this.endDate,
    this.isFeatured = false,
    this.features = const [],
    this.client,
    this.rating,
    this.downloads,
  });

  /// Create a copy of the project with updated fields
  Project copyWith({
    String? id,
    String? title,
    String? description,
    String? shortDescription,
    List<String>? images,
    List<String>? technologies,
    String? githubUrl,
    String? liveUrl,
    String? playStoreUrl,
    String? appStoreUrl,
    ProjectCategory? category,
    ProjectStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    bool? isFeatured,
    List<String>? features,
    String? client,
    double? rating,
    int? downloads,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      images: images ?? this.images,
      technologies: technologies ?? this.technologies,
      githubUrl: githubUrl ?? this.githubUrl,
      liveUrl: liveUrl ?? this.liveUrl,
      playStoreUrl: playStoreUrl ?? this.playStoreUrl,
      appStoreUrl: appStoreUrl ?? this.appStoreUrl,
      category: category ?? this.category,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isFeatured: isFeatured ?? this.isFeatured,
      features: features ?? this.features,
      client: client ?? this.client,
      rating: rating ?? this.rating,
      downloads: downloads ?? this.downloads,
    );
  }

  /// Convert project to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'shortDescription': shortDescription,
      'images': images,
      'technologies': technologies,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'playStoreUrl': playStoreUrl,
      'appStoreUrl': appStoreUrl,
      'category': category.toString().split('.').last,
      'status': status.toString().split('.').last,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'isFeatured': isFeatured,
      'features': features,
      'client': client,
      'rating': rating,
      'downloads': downloads,
    };
  }

  /// Create project from JSON
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String,
      images: List<String>.from(json['images'] as List),
      technologies: List<String>.from(json['technologies'] as List),
      githubUrl: json['githubUrl'] as String?,
      liveUrl: json['liveUrl'] as String?,
      playStoreUrl: json['playStoreUrl'] as String?,
      appStoreUrl: json['appStoreUrl'] as String?,
      category: ProjectCategory.values.firstWhere(
        (e) => e.toString().split('.').last == json['category'],
      ),
      status: ProjectStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
      ),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      isFeatured: json['isFeatured'] as bool? ?? false,
      features: List<String>.from(json['features'] as List? ?? []),
      client: json['client'] as String?,
      rating: json['rating'] as double?,
      downloads: json['downloads'] as int?,
    );
  }

  @override
  String toString() {
    return 'Project(id: $id, title: $title, category: $category, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Project && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Enum for project categories
enum ProjectCategory {
  mobileApp,
  webApp,
  desktopApp,
  api,
  library,
  plugin,
  game,
  other,
}

/// Extension for project category
extension ProjectCategoryExtension on ProjectCategory {
  String get displayName {
    switch (this) {
      case ProjectCategory.mobileApp:
        return 'Mobile App';
      case ProjectCategory.webApp:
        return 'Web App';
      case ProjectCategory.desktopApp:
        return 'Desktop App';
      case ProjectCategory.api:
        return 'API';
      case ProjectCategory.library:
        return 'Library';
      case ProjectCategory.plugin:
        return 'Plugin';
      case ProjectCategory.game:
        return 'Game';
      case ProjectCategory.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case ProjectCategory.mobileApp:
        return '📱';
      case ProjectCategory.webApp:
        return '🌐';
      case ProjectCategory.desktopApp:
        return '💻';
      case ProjectCategory.api:
        return '🔌';
      case ProjectCategory.library:
        return '📚';
      case ProjectCategory.plugin:
        return '🔧';
      case ProjectCategory.game:
        return '🎮';
      case ProjectCategory.other:
        return '📦';
    }
  }
}

/// Enum for project status
enum ProjectStatus { planning, inProgress, completed, maintenance, deprecated }

/// Extension for project status
extension ProjectStatusExtension on ProjectStatus {
  String get displayName {
    switch (this) {
      case ProjectStatus.planning:
        return 'Planning';
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.maintenance:
        return 'Maintenance';
      case ProjectStatus.deprecated:
        return 'Deprecated';
    }
  }

  String get color {
    switch (this) {
      case ProjectStatus.planning:
        return '#FFA726'; // Orange
      case ProjectStatus.inProgress:
        return '#42A5F5'; // Blue
      case ProjectStatus.completed:
        return '#66BB6A'; // Green
      case ProjectStatus.maintenance:
        return '#FFCA28'; // Yellow
      case ProjectStatus.deprecated:
        return '#EF5350'; // Red
    }
  }
}
