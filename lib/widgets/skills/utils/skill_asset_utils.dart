import 'package:flutter/material.dart';

/// Utility class for skill asset management
class SkillAssetUtils {
  /// Get asset path for a skill logo
  static String getAssetPath(String skillName) {
    String fileName;

    // Map skill names to your actual file names
    switch (skillName.toLowerCase()) {
      case 'flutter':
        fileName = 'flutter_logo.png';
        break;
      case 'dart':
        fileName = 'dart_logo.png';
        break;
      case 'c++':
        fileName = 'c++_logo.png';
        break;
      case 'c#':
        fileName = 'c#_logo.png';
        break;
      case 'c':
        fileName = 'c_logo.png';
        break;
      case '.net core':
      case 'dotnet':
        fileName = 'dotnet_core_logo.png';
        break;
      case 'python':
        fileName = 'python_logo.png';
        break;
      case 'firebase':
        fileName = 'firebase_logo.png';
        break;
      case 'figma':
        fileName = 'figma_logo.png';
        break;
      case 'getx':
        fileName = 'getx_logo.png';
        break;
      case 'provider':
        fileName = 'provider_logo.png';
        break;
      case 'git':
      case 'github':
        fileName = 'github_logo.png';
        break;
      case 'sqlite':
        fileName = 'sqllite_logo.png';
        break;
      case 'sql server':
        fileName = 'sqlserver_logo.png';
        break;
      case 'supabase':
        fileName = 'supabase_logo.png';
        break;
      case 'bloc':
        fileName = 'bloc_logo.png';
        break;
      case 'javascript':
        fileName = 'javascript_logo.png';
        break;
      case 'html':
        fileName = 'html_logo.png';
        break;
      case 'css':
        fileName = 'css_logo.png';
        break;
      case 'android':
        fileName = 'android_logo.png';
        break;
      case 'vs code':
        fileName = 'vs_code_logo.png';
        break;
      default:
        // Fallback to generated name
        fileName =
            skillName
                .toLowerCase()
                .replaceAll(' ', '_')
                .replaceAll('#', 'sharp')
                .replaceAll('+', 'plus') +
            '_logo.png';
    }

    return 'assets/logos/$fileName';
  }

  /// Check if local asset exists
  static Future<bool> checkAssetExists(
    BuildContext context,
    String assetPath,
  ) async {
    try {
      // Quick check for known missing assets to avoid async loading
      String fileName = assetPath.split('/').last;
      List<String> knownMissingAssets = [
        'javascript_logo.png',
        'android_logo.png',
      ];

      if (knownMissingAssets.contains(fileName)) {
        return false;
      }

      await DefaultAssetBundle.of(context).load(assetPath);
      return true;
    } catch (e) {
      return false;
    }
  }
}
