/// Model class for experience data
class Experience {
  final String id;
  final String company;
  final String position;
  final String description;
  final DateTime startDate;
  final DateTime? endDate;
  final bool isCurrent;
  final String? location;
  final String? companyLogo;
  final String? companyUrl;
  final List<String> responsibilities;
  final List<String> achievements;
  final List<String> technologies;
  final EmploymentType employmentType;

  const Experience({
    required this.id,
    required this.company,
    required this.position,
    required this.description,
    required this.startDate,
    this.endDate,
    this.isCurrent = false,
    this.location,
    this.companyLogo,
    this.companyUrl,
    this.responsibilities = const [],
    this.achievements = const [],
    this.technologies = const [],
    required this.employmentType,
  });

  /// Get duration of experience
  Duration get duration {
    final end = endDate ?? DateTime.now();
    return end.difference(startDate);
  }

  /// Get formatted duration string
  String get formattedDuration {
    final totalMonths = duration.inDays ~/ 30;
    final years = totalMonths ~/ 12;
    final months = totalMonths % 12;

    if (years > 0 && months > 0) {
      return '$years year${years > 1 ? 's' : ''} $months month${months > 1 ? 's' : ''}';
    } else if (years > 0) {
      return '$years year${years > 1 ? 's' : ''}';
    } else if (months > 0) {
      return '$months month${months > 1 ? 's' : ''}';
    } else {
      return 'Less than a month';
    }
  }

  /// Get formatted date range
  String get formattedDateRange {
    final startStr = '${_monthNames[startDate.month - 1]} ${startDate.year}';
    final endStr = isCurrent
        ? 'Present'
        : '${_monthNames[endDate!.month - 1]} ${endDate!.year}';
    return '$startStr - $endStr';
  }

  static const List<String> _monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// Create a copy of the experience with updated fields
  Experience copyWith({
    String? id,
    String? company,
    String? position,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    bool? isCurrent,
    String? location,
    String? companyLogo,
    String? companyUrl,
    List<String>? responsibilities,
    List<String>? achievements,
    List<String>? technologies,
    EmploymentType? employmentType,
  }) {
    return Experience(
      id: id ?? this.id,
      company: company ?? this.company,
      position: position ?? this.position,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCurrent: isCurrent ?? this.isCurrent,
      location: location ?? this.location,
      companyLogo: companyLogo ?? this.companyLogo,
      companyUrl: companyUrl ?? this.companyUrl,
      responsibilities: responsibilities ?? this.responsibilities,
      achievements: achievements ?? this.achievements,
      technologies: technologies ?? this.technologies,
      employmentType: employmentType ?? this.employmentType,
    );
  }

  /// Convert experience to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company': company,
      'position': position,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'isCurrent': isCurrent,
      'location': location,
      'companyLogo': companyLogo,
      'companyUrl': companyUrl,
      'responsibilities': responsibilities,
      'achievements': achievements,
      'technologies': technologies,
      'employmentType': employmentType.toString().split('.').last,
    };
  }

  /// Create experience from JSON
  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'] as String,
      company: json['company'] as String,
      position: json['position'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      isCurrent: json['isCurrent'] as bool? ?? false,
      location: json['location'] as String?,
      companyLogo: json['companyLogo'] as String?,
      companyUrl: json['companyUrl'] as String?,
      responsibilities: List<String>.from(
        json['responsibilities'] as List? ?? [],
      ),
      achievements: List<String>.from(json['achievements'] as List? ?? []),
      technologies: List<String>.from(json['technologies'] as List? ?? []),
      employmentType: EmploymentType.values.firstWhere(
        (e) => e.toString().split('.').last == json['employmentType'],
      ),
    );
  }

  @override
  String toString() {
    return 'Experience(id: $id, company: $company, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Experience && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Enum for employment types
enum EmploymentType {
  fullTime,
  partTime,
  contract,
  freelance,
  internship,
  volunteer,
}

/// Extension for employment type
extension EmploymentTypeExtension on EmploymentType {
  String get displayName {
    switch (this) {
      case EmploymentType.fullTime:
        return 'Full-time';
      case EmploymentType.partTime:
        return 'Part-time';
      case EmploymentType.contract:
        return 'Contract';
      case EmploymentType.freelance:
        return 'Freelance';
      case EmploymentType.internship:
        return 'Internship';
      case EmploymentType.volunteer:
        return 'Volunteer';
    }
  }

  String get color {
    switch (this) {
      case EmploymentType.fullTime:
        return '#4CAF50'; // Green
      case EmploymentType.partTime:
        return '#2196F3'; // Blue
      case EmploymentType.contract:
        return '#FF9800'; // Orange
      case EmploymentType.freelance:
        return '#9C27B0'; // Purple
      case EmploymentType.internship:
        return '#FFC107'; // Amber
      case EmploymentType.volunteer:
        return '#795548'; // Brown
    }
  }
}
