import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import 'components/about_section_title.dart';
import 'components/about_mobile_layout.dart';
import 'components/about_desktop_layout.dart';

/// About section with clean architecture
class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideFromLeftAnimation;
  late Animation<Offset> _slideFromRightAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    // Main fade animation
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Slide animations
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _slideFromLeftAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );
    _slideFromRightAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _fadeController.forward();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.getResponsivePadding(context),
      decoration: const BoxDecoration(gradient: AppColors.midnightTechGradient),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // Section Title
          FadeTransition(
            opacity: _fadeAnimation,
            child: const AboutSectionTitle(),
          ),

          const SizedBox(height: 60),

          // Main Content
          Responsive.isMobile(context)
              ? AboutMobileLayout(
                  slideFromLeftAnimation: _slideFromLeftAnimation,
                  slideFromRightAnimation: _slideFromRightAnimation,
                )
              : AboutDesktopLayout(
                  slideFromLeftAnimation: _slideFromLeftAnimation,
                  slideFromRightAnimation: _slideFromRightAnimation,
                ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
