import 'package:flutter/material.dart';

/// Custom theme colors for the portfolio
class AppColors {
  // Primary Colors - Professional Blue
  // Primary Colors - Midnight Tech (cool blue/cyan, no purple)
  static const Color primary = Color(0xFF0EA5E9); // Sky 500
  static const Color primaryLight = Color(0xFF38BDF8); // Sky 400
  static const Color primaryDark = Color(0xFF075985); // Sky 900

  // Accent / Secondary Colors
  // Secondary Colors - Teal/Aqua
  static const Color secondary = Color(0xFF14B8A6); // Teal 500
  static const Color secondaryLight = Color(0xFF5EEAD4); // Teal 300
  static const Color secondaryDark = Color(0xFF0F766E); // Teal 700

  static const Color accent = Color(0xFF10B981); // Electric Mint
  static const Color accentLight = Color(0xFF34D399);
  static const Color accentDark = Color(0xFF047857);
  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyDark = Color(0xFF424242);

  // Background Colors - Modern Light/Dark scheme
  // Background Colors - Midnight darks and clean light
  static const Color background = Color(0xFFF7FAFC);
  static const Color backgroundDark = Color(0xFF0B1021); // Deep midnight
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF0F172A); // Navy slate

  // Text Colors
  // Text Colors - Cool contrast
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textHint = Color(0xFF94A3B8);
  static const Color textLight = Color(0xFFF9FAFB); // For dark mode

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Dark Hero Gradient
  // Dark Hero Gradient
  static const LinearGradient darkHeroGradient = LinearGradient(
    colors: [Color(0xFF0B1021), Color(0xFF0F172A), Color(0xFF0B1021)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.6, 1.0],
  );

  // Reusable midnight tech background gradient for sections
  static const LinearGradient midnightTechGradient = LinearGradient(
    colors: [Color(0xFF0B1021), Color(0xFF0F172A), Color(0xFF0B1021)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0],
  );

  // Social Media Colors
  static const Color facebook = Color(0xFF1877F2);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color linkedin = Color(0xFF0A66C2);
  static const Color github = Color(0xFF181717);
  static const Color instagram = Color(0xFFE4405F);
  static const Color youtube = Color(0xFFFF0000);
  static const Color whatsapp = Color(0xFF25D366);
  static const Color telegram = Color(0xFF0088CC);

  // Technology Colors
  static const Color flutter = Color(0xFF02569B);
  static const Color dart = Color(0xFF0175C2);
  static const Color javascript = Color(0xFFF7DF1E);
  static const Color typescript = Color(0xFF3178C6);
  static const Color react = Color(0xFF61DAFB);
  static const Color vue = Color(0xFF4FC08D);
  static const Color angular = Color(0xFFDD0031);
  static const Color nodejs = Color(0xFF339933);
  static const Color python = Color(0xFF3776AB);
  static const Color java = Color(0xFFED8B00);
  static const Color kotlin = Color(0xFF7F52FF);
  static const Color swift = Color(0xFFFA7343);
  static const Color csharp = Color(0xFF239120);
  static const Color php = Color(0xFF777BB4);
  static const Color go = Color(0xFF00ADD8);
  static const Color rust = Color(0xFF000000);
  static const Color mysql = Color(0xFF4479A1);
  static const Color postgresql = Color(0xFF336791);
  static const Color mongodb = Color(0xFF47A248);
  static const Color firebase = Color(0xFFFFCA28);
  static const Color aws = Color(0xFFFF9900);
  static const Color azure = Color(0xFF0078D4);
  static const Color docker = Color(0xFF2496ED);
  static const Color kubernetes = Color(0xFF326CE5);
}
