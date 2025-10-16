import 'package:flutter/material.dart';
import 'hero_text_content.dart';
import 'hero_profile_image.dart';

/// Mobile layout with image above text
class HeroMobileLayout extends StatefulWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;

  const HeroMobileLayout({
    super.key,
    this.onViewWorkPressed,
    this.onContactPressed,
  });

  @override
  State<HeroMobileLayout> createState() => _HeroMobileLayoutState();
}

class _HeroMobileLayoutState extends State<HeroMobileLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutCubic),
    );

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) _scaleController.forward();
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Animated Profile Image at the top for mobile
        ScaleTransition(
          scale: _scaleAnimation,
          child: const HeroProfileImage(size: 200),
        ),

        const SizedBox(height: 40),

        // Animated Text Content below image
        HeroTextContent(
          onViewWorkPressed: widget.onViewWorkPressed,
          onContactPressed: widget.onContactPressed,
        ),
      ],
    );
  }
}
