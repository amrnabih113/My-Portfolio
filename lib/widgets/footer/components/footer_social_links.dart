import 'package:flutter/material.dart';
import 'footer_social_button.dart';

/// Social links widget
class FooterSocialLinks extends StatelessWidget {
  final VoidCallback? onGitHubTap;
  final VoidCallback? onLinkedInTap;
  final VoidCallback? onTwitterTap;
  final VoidCallback? onEmailTap;

  const FooterSocialLinks({
    super.key,
    this.onGitHubTap,
    this.onLinkedInTap,
    this.onTwitterTap,
    this.onEmailTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        FooterSocialButton(
          icon: Icons.code,
          label: 'GitHub',
          onTap: onGitHubTap ?? () => print('GitHub tapped'),
        ),
        FooterSocialButton(
          icon: Icons.work,
          label: 'LinkedIn',
          onTap: onLinkedInTap ?? () => print('LinkedIn tapped'),
        ),
        FooterSocialButton(
          icon: Icons.alternate_email,
          label: 'Twitter',
          onTap: onTwitterTap ?? () => print('Twitter tapped'),
        ),
        FooterSocialButton(
          icon: Icons.email,
          label: 'Email',
          onTap: onEmailTap ?? () => print('Email tapped'),
        ),
      ],
    );
  }
}
