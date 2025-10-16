import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../utils/utils.dart';
import 'components/footer_version_info.dart';

/// Footer section with clean architecture
class FooterSection extends StatelessWidget {
  final String? version;

  const FooterSection({super.key, this.version = '1.0.0'});

  Future<void> _launchUrl(String url) async {
    if (kIsWeb) {
      await launchUrlString(url, webOnlyWindowName: '_blank');
    } else {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.getResponsivePadding(context),
      decoration: const BoxDecoration(
        gradient: AppColors.midnightTechGradient,
        border: Border(top: BorderSide(color: Color(0xFF0EA5E9), width: 2)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _launchUrl('https://amrnabih.com/privacy'),
                child: Text(
                  'Privacy Policy',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textLight.withOpacity(0.7),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => _launchUrl('https://amrnabih.com/terms'),
                child: Text(
                  'Terms',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textLight.withOpacity(0.7),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          FooterVersionInfo(version: version ?? '1.0.0'),
          const SizedBox(height: 16),
          Text(
            '© 2025 Amr Nabih. All rights reserved.',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textLight.withOpacity(0.6),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Cairo, Egypt · Building beautiful apps worldwide',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textLight.withOpacity(0.5),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Crafted with Flutter & Love',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
