import 'package:flutter/material.dart';
import '../../utils/utils.dart';

/// Page content section widget for displaying current page info
class PageContentSection extends StatelessWidget {
  final String currentPageName;

  const PageContentSection({super.key, required this.currentPageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.midnightTechGradient),
      padding: Responsive.getResponsivePadding(context),
      child: Column(
        children: [
          const SizedBox(height: 48),
          _PageTitle(pageName: currentPageName),
          const SizedBox(height: 24),
          _PageDescription(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Page title widget
class _PageTitle extends StatelessWidget {
  final String pageName;

  const _PageTitle({required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Current Page: $pageName',
      style: AppTextStyles.h3,
      textAlign: TextAlign.center,
    );
  }
}

/// Page description widget
class _PageDescription extends StatelessWidget {
  const _PageDescription();

  @override
  Widget build(BuildContext context) {
    return Text(
      'This is a demo of the responsive portfolio. Try resizing your browser window or viewing on mobile to see how it adapts to different screen sizes!',
      style: AppTextStyles.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
