import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (kIsWeb) {
      // Opens in a new tab on web
      await launchUrlString(url, webOnlyWindowName: '_blank');
    } else {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      decoration: const BoxDecoration(gradient: AppColors.midnightTechGradient),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (rect) => LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                      AppColors.accent,
                    ],
                  ).createShader(rect),
                  child: Text(
                    "Let's Connect",
                    style: AppTextStyles.h3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ready to Build Your Next Mobile Masterpiece?',
                  style: AppTextStyles.h5.copyWith(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  "I'm excited to collaborate on projects that demand clean code, innovative design, and exceptional performance. Reach out to discuss how I can help bring your app idea to life!",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textLight.withValues(alpha: 0.85),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    _ContactActionButton(
                      icon: Icons.email_rounded,
                      label: 'Email',
                      color: AppColors.primary,
                      onTap: () => _launchUrl('mailto:amrnabih113@gmail.com'),
                    ),
                    _ContactActionButton(
                      icon: Icons.phone_rounded,
                      label: 'Call',
                      color: AppColors.secondary,
                      onTap: () => _launchUrl('tel:+201141844227'),
                    ),
                    _ContactActionButton(
                      iconWidget: Image(
                        image: const AssetImage('assets/logos/linkedin.png'),
                        height: 22,
                        width: 22,
                      ),
                      label: 'LinkedIn',
                      color: AppColors.accent,
                      onTap: () =>
                          _launchUrl('https://www.linkedin.com/in/amr-nabih112'),
                    ),
                    _ContactActionButton(
                      iconWidget: Image.asset(
                        'assets/logos/github_logo.png',
                        height: 22,
                        width: 22,
                      ),
                      label: 'GitHub',
                      color: AppColors.primary,
                      onTap: () => _launchUrl('https://github.com/amrnabih113'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'amrnabih113@gmail.com | +201141844227',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textLight.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactActionButton extends StatefulWidget {
  final IconData? icon;
  final Widget? iconWidget;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ContactActionButton({
    this.icon,
    this.iconWidget,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<_ContactActionButton> createState() => _ContactActionButtonState();
}

class _ContactActionButtonState extends State<_ContactActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: _isHovered
              ? LinearGradient(colors: [widget.color, AppColors.surfaceDark])
              : null,
          color: !_isHovered
              ? AppColors.surfaceDark.withValues(alpha: 0.7)
              : null,
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.2),
                    blurRadius: 12,
                  ),
                ]
              : [],
          border: Border.all(
            color: _isHovered ? widget.color : AppColors.surfaceDark,
            width: 2,
          ),
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.iconWidget != null)
                  widget.iconWidget!
                else if (widget.icon != null)
                  Icon(widget.icon, color: widget.color, size: 22),
                const SizedBox(width: 10),
                Text(
                  widget.label,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: widget.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            AppColors.surfaceDark.withValues(alpha: 0.7),
            AppColors.surfaceDark.withValues(alpha: 0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.18),
          width: 2,
        ),
      ),
      child: Padding(padding: const EdgeInsets.all(32), child: child),
    );
  }
}
