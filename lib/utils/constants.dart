/// Application constants for the portfolio
class AppConstants {
  // App Information
  static const String appName = 'My Portfolio';
  static const String appVersion = '1.0.0';

  static const String portfolioUrl = 'https://yourportfolio.com';

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 500);
  static const Duration mediumAnimation = Duration(milliseconds: 800);
  static const Duration longAnimation = Duration(milliseconds: 1200);

  // Spacing Values
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border Radius
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusXXL = 24.0;

  // Elevation Values
  static const double elevationS = 2.0;
  static const double elevationM = 4.0;
  static const double elevationL = 8.0;
  static const double elevationXL = 16.0;

  // Font Sizes
  static const double fontSizeXS = 10.0;
  static const double fontSizeS = 12.0;
  static const double fontSizeM = 14.0;
  static const double fontSizeL = 16.0;
  static const double fontSizeXL = 18.0;
  static const double fontSizeXXL = 20.0;
  static const double fontSizeHeadingS = 24.0;
  static const double fontSizeHeadingM = 28.0;
  static const double fontSizeHeadingL = 32.0;
  static const double fontSizeHeadingXL = 36.0;
  static const double fontSizeHeadingXXL = 48.0;

  // Icon Sizes
  static const double iconSizeS = 16.0;
  static const double iconSizeM = 24.0;
  static const double iconSizeL = 32.0;
  static const double iconSizeXL = 48.0;

  // Button Heights
  static const double buttonHeightS = 32.0;
  static const double buttonHeightM = 40.0;
  static const double buttonHeightL = 48.0;
  static const double buttonHeightXL = 56.0;

  // App Bar Heights
  static const double appBarHeight = 56.0;
  static const double toolbarHeight = 56.0;

  // Navigation
  static const String homeRoute = '/home';
  static const String aboutRoute = '/about';
  static const String portfolioRoute = '/portfolio';
  static const String servicesRoute = '/services';
  static const String contactRoute = '/contact';

  // API Endpoints (if needed)
  static const String baseUrl = 'https://api.yourportfolio.com';
  static const String contactEndpoint = '/contact';

  // Form Validation
  static const int maxNameLength = 50;
  static const int maxEmailLength = 100;
  static const int maxMessageLength = 500;

  // Assets Paths
  static const String imagesPath = 'assets/images/';
  static const String iconsPath = 'assets/icons/';
  static const String animationsPath = 'assets/animations/';

  // Common Asset Names
  static const String profileImage = '${imagesPath}profile.jpg';
  static const String logoImage = '${imagesPath}logo.png';
  static const String backgroundImage = '${imagesPath}background.jpg';

  // Skills Categories
  static const List<String> frontendSkills = [
    'Flutter',
    'Dart',
    'React',
    'JavaScript',
    'TypeScript',
    'HTML',
    'CSS',
    'Vue.js',
  ];

  static const List<String> backendSkills = [
    'Node.js',
    'Python',
    'Java',
    'C#',
    'PHP',
    'Go',
    'Ruby',
    'Rust',
  ];

  static const List<String> databaseSkills = [
    'MySQL',
    'PostgreSQL',
    'MongoDB',
    'Firebase',
    'SQLite',
    'Redis',
  ];

  static const List<String> toolsSkills = [
    'Git',
    'Docker',
    'AWS',
    'Azure',
    'Jenkins',
    'Kubernetes',
    'Figma',
    'Adobe XD',
  ];

  // Project Types
  static const List<String> projectTypes = [
    'Mobile App',
    'Web App',
    'Desktop App',
    'API',
    'Library',
    'Plugin',
  ];

  // Service Types
  static const List<String> serviceTypes = [
    'Mobile App Development',
    'Web Development',
    'UI/UX Design',
    'Consultation',
    'Code Review',
    'Maintenance',
  ];
}

/// URL constants for external links
class UrlConstants {
  static const String flutterDocs = 'https://flutter.dev/docs';
  static const String dartDocs = 'https://dart.dev/guides';
  static const String githubRepo = 'https://github.com/flutter/flutter';
  static const String pubDev = 'https://pub.dev/';
}

/// RegExp patterns for validation
class ValidationPatterns {
  static final RegExp email = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp phone = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');

  static final RegExp url = RegExp(
    r'^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&=]*)$',
  );

  static final RegExp name = RegExp(r'^[a-zA-Z\s]{2,50}$');
}
