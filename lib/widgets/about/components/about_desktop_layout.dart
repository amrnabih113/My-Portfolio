import 'package:flutter/material.dart';
import 'about_profile_image.dart';
import 'about_content.dart';

/// Desktop layout for about section
class AboutDesktopLayout extends StatelessWidget {
  final Animation<Offset> slideFromLeftAnimation;
  final Animation<Offset> slideFromRightAnimation;

  const AboutDesktopLayout({
    super.key,
    required this.slideFromLeftAnimation,
    required this.slideFromRightAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // About Content (Left side)
        Expanded(
          flex: 2,
          child: SlideTransition(
            position: slideFromLeftAnimation,
            child: const AboutContent(),
          ),
        ),

        const SizedBox(width: 60),

        // Profile Image (Right side)
        Expanded(
          flex: 1,
          child: SlideTransition(
            position: slideFromRightAnimation,
            child: const AboutProfileImage(),
          ),
        ),
      ],
    );
  }
}
