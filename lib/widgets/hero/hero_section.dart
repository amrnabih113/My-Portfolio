import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import 'components/hero_background_image.dart';
import 'components/hero_dark_overlay.dart';
import 'components/hero_mobile_layout.dart';
import 'components/hero_desktop_layout.dart';

/// Main hero section with clean architecture
class HeroSection extends StatelessWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;

  const HeroSection({
    super.key,
    this.onViewWorkPressed,
    this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Background Image
          const HeroBackgroundImage(),

          // Dark Overlay
          const HeroDarkOverlay(),

          // Main Content
          Positioned.fill(
            child: Container(
              padding: Responsive.getResponsivePadding(context),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Responsive.isMobile(context)
                      ? HeroMobileLayout(
                          onViewWorkPressed: onViewWorkPressed,
                          onContactPressed: onContactPressed,
                        )
                      : HeroDesktopLayout(
                          onViewWorkPressed: onViewWorkPressed,
                          onContactPressed: onContactPressed,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}