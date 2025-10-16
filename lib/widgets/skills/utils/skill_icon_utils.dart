import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Utility class for skill icons and colors
class SkillIconUtils {
  /// Get Material Design icon for a skill
  static IconData getSkillIcon(String skillName) {
    switch (skillName.toLowerCase()) {
      case 'flutter':
        return Icons.flutter_dash;
      case 'dart':
        return Icons.data_object;
      case 'c++':
        return Icons.code;
      case 'c#':
        return Icons.code_rounded;
      case 'c':
        return Icons.code;
      case '.net core':
      case 'dotnet':
        return Icons.web;
      case 'python':
        return Icons.psychology;
      case 'javascript':
        return Icons.javascript;
      case 'firebase':
        return Icons.local_fire_department;
      case 'git':
        return Icons.source;
      case 'vs code':
        return Icons.code;
      case 'android':
        return Icons.android;
      case 'figma':
        return Icons.design_services;
      case 'getx':
        return Icons.settings_input_component;
      case 'provider':
        return Icons.account_tree;
      case 'bloc':
        return Icons.view_stream;
      case 'supabase':
        return Icons.storage;
      case 'sqlite':
        return Icons.storage_rounded;
      case 'sql server':
        return Icons.dns;
      case 'clean architecture':
        return Icons.architecture;
      case 'mvvm':
        return Icons.view_module;
      case 'solid':
        return Icons.foundation;
      case 'mvc':
        return Icons.layers;
      default:
        return Icons.code;
    }
  }

  /// Get brand color for a skill
  static Color getSkillColor(String skillName) {
    switch (skillName.toLowerCase()) {
      case 'flutter':
        return const Color(0xFF02569B);
      case 'dart':
        return const Color(0xFF0175C2);
      case 'c++':
        return const Color(0xFF00599C);
      case 'c#':
        return const Color(0xFF512BD4);
      case 'c':
        return const Color(0xFF00599C);
      case '.net core':
      case 'dotnet':
        return const Color(0xFF512BD4);
      case 'python':
        return const Color(0xFF3776AB);
      case 'javascript':
        return const Color(0xFFF7DF1E);
      case 'firebase':
        return const Color(0xFFFFCA28);
      case 'git':
        return const Color(0xFFF05032);
      case 'vs code':
        return const Color(0xFF007ACC);
      case 'android':
        return const Color(0xFF3DDC84);
      case 'figma':
        return const Color(0xFFF24E1E);
      case 'getx':
        return AppColors.primary;
      case 'provider':
        return AppColors.secondary;
      case 'bloc':
        return const Color(0xFF00D4FF);
      case 'supabase':
        return const Color(0xFF3ECF8E);
      case 'sqlite':
        return const Color(0xFF003B57);
      case 'sql server':
        return const Color(0xFFCC2927);
      case 'clean architecture':
        return AppColors.accent;
      case 'mvvm':
        return const Color(0xFF9C27B0);
      case 'solid':
        return const Color(0xFF795548);
      case 'mvc':
        return const Color(0xFF607D8B);
      default:
        return AppColors.primary;
    }
  }
}
