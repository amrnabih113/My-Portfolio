import '../models/skill_models.dart';

/// Skills data containing all skill categories and their respective skills
class SkillsData {
  static List<SkillCategoryModel> getSkillCategories() {
    return [
      SkillCategoryModel(
        title: 'Programming Languages',
        skills: [
          SkillModel(
            name: 'Dart',
            imageUrl:
                'https://storage.googleapis.com/cms-storage-bucket/ec64036b4e7d4f7c991f.svg',
          ),
          SkillModel(
            name: 'C++',
            imageUrl:
                'https://raw.githubusercontent.com/isocpp/logos/master/cpp_logo.png',
          ),
          SkillModel(
            name: 'C#',
            imageUrl:
                'https://seeklogo.com/images/C/c-sharp-c-logo-02F17714BA-seeklogo.com.png',
          ),
          SkillModel(name: 'C'),

          SkillModel(
            name: 'Python',
            imageUrl:
                'https://www.python.org/static/community_logos/python-logo-only.png',
          ),
          SkillModel(
            name: 'JavaScript',
            imageUrl:
                'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg',
          ),
          SkillModel(name: 'html'),
          SkillModel(name: 'css'),
        ],
      ),
      SkillCategoryModel(
        title: 'Frameworks & Tools',
        skills: [
          SkillModel(
            name: 'Flutter',
            imageUrl:
                'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
          ),
          SkillModel(name: '.NET Core'),
          SkillModel(
            name: 'Firebase',
            imageUrl:
                'https://firebase.google.com/downloads/brand/PNG/logo-logomark.png',
          ),
          SkillModel(name: 'Supabase'),
          SkillModel(
            name: 'Figma',
            imageUrl:
                'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/figma/figma-original.svg',
          ),
          SkillModel(name: 'SQLite'),
          SkillModel(name: 'SQL Server'),
          SkillModel(
            name: 'Git',
            imageUrl:
                'https://git-scm.com/images/logos/downloads/Git-Logo-2Color.png',
          ),
          SkillModel(
            name: 'VS Code',
            imageUrl:
                'https://code.visualstudio.com/assets/images/code-stable.png',
          ),
          SkillModel(
            name: 'Android',
            imageUrl:
                'https://developer.android.com/static/images/brand/Android_Robot.png',
          ),
        ],
      ),
      SkillCategoryModel(
        title: 'State Management',
        skills: [
          SkillModel(
            name: 'GetX',
            imageUrl:
                'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
          ),
          SkillModel(
            name: 'Provider',
            imageUrl:
                'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
          ),
          SkillModel(name: 'BLoC'),
        ],
      ),
      SkillCategoryModel(
        title: 'Architecture Patterns',
        skills: [
          SkillModel(name: 'Clean Architecture', isText: true),
          SkillModel(name: 'MVVM', isText: true),
          SkillModel(name: 'SOLID Principles', isText: true),
          SkillModel(name: 'MVC', isText: true),
        ],
      ),
    ];
  }
}
