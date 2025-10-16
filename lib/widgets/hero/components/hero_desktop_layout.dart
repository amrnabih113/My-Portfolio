import 'package:flutter/material.dart';
import 'hero_text_content.dart';
import 'hero_profile_image.dart';

/// Desktop layout with text on left and image on right
class HeroDesktopLayout extends StatefulWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;

  const HeroDesktopLayout({
    super.key,
    this.onViewWorkPressed,
    this.onContactPressed,
  });

  @override
  State<HeroDesktopLayout> createState() => _HeroDesktopLayoutState();
}

class _HeroDesktopLayoutState extends State<HeroDesktopLayout>
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
    return Row(
      children: [
        // Text content on the left
        Expanded(
          flex: 5,
          child: HeroTextContent(
            onViewWorkPressed: widget.onViewWorkPressed,
            onContactPressed: widget.onContactPressed,
          ),
        ),

        const SizedBox(width: 60),

        // Animated Profile Image on the right for desktop
        Expanded(
          flex: 4,
          child: Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: const HeroProfileImage(size: 300),
            ),
          ),
        ),
      ],
    );
  }
}
