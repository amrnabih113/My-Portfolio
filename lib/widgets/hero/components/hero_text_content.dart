import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import 'hero_typewriter_greeting.dart';
import 'hero_subtitle.dart';
import 'hero_name.dart';
import 'hero_main_description.dart';
import 'hero_animated_buttons.dart';

/// Text content section of the hero
class HeroTextContent extends StatelessWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;

  const HeroTextContent({
    super.key,
    this.onViewWorkPressed,
    this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // "Hello There!" with typewriter effect
        const HeroTypewriterGreeting(),

        const SizedBox(height: 8),

        // "I am" subtitle
        const HeroSubtitle(),

        const SizedBox(height: 16),

        // "Amr Mohamed Nabih" with scale animation
        const HeroName(),

        const SizedBox(height: 12),

        // Main description with slide animation
        const HeroMainDescription(),

        const SizedBox(height: 32),

        // Buttons with animation
        HeroAnimatedButtons(
          onViewWorkPressed: onViewWorkPressed,
          onContactPressed: onContactPressed,
        ),
      ],
    );
  }
}
