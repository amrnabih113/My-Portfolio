import 'package:flutter/material.dart';
import 'about_profile_image.dart';
import 'about_content.dart';

/// Mobile layout for about section
class AboutMobileLayout extends StatelessWidget {
  final Animation<Offset> slideFromLeftAnimation;
  final Animation<Offset> slideFromRightAnimation;

  const AboutMobileLayout({
    super.key,
    required this.slideFromLeftAnimation,
    required this.slideFromRightAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Image
        SlideTransition(
          position: slideFromLeftAnimation,
          child: const AboutProfileImage(),
        ),

        const SizedBox(height: 40),

        // About Content
        SlideTransition(
          position: slideFromRightAnimation,
          child: const AboutContent(),
        ),
      ],
    );
  }
}
