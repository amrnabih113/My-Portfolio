import 'package:flutter/material.dart';
import '../../utils/utils.dart';

/// Services section showcasing offerings
class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideUpAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1100),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _slideUpAnimation =
        Tween<Offset>(begin: const Offset(0, .2), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _fadeController.forward();
    });
    Future.delayed(const Duration(milliseconds: 350), () {
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
      decoration: const BoxDecoration(gradient: AppColors.midnightTechGradient),
      child: Padding(
        padding: Responsive.getResponsivePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeAnimation,
              child: const _ServicesSectionTitle(),
            ),
            const SizedBox(height: 48),
            SlideTransition(
              position: _slideUpAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: const _ServicesGrid(),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class _ServicesSectionTitle extends StatelessWidget {
  const _ServicesSectionTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Services Offered',
          style: AppTextStyles.h2.copyWith(
            fontSize: Responsive.getResponsiveFontSize(
              context,
              mobile: 32,
              tablet: 40,
              desktop: 48,
            ),
            color: AppColors.textLight,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Amr Nabih • End-to-End Mobile App Development',
          style: AppTextStyles.subtitle2.copyWith(color: AppColors.textLight),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ServicesGrid extends StatelessWidget {
  const _ServicesGrid();

  @override
  Widget build(BuildContext context) {
    final services = [
      _ServiceItem(
        icon: Icons.phone_android_rounded,
        title: 'Cross-Platform Development',
        description:
            'Building modern, high-performance mobile apps for iOS & Android using Flutter.',
        gradient: AppColors.primaryGradient,
      ),
      _ServiceItem(
        icon: Icons.cloud_sync_rounded,
        title: 'Backend Integration',
        description:
            'Seamless integration with Firebase, Supabase, REST APIs, and secure data handling.',
        gradient: AppColors.secondaryGradient,
      ),
      _ServiceItem(
        icon: Icons.architecture_rounded,
        title: 'Clean Architecture',
        description:
            'Implementing scalable, maintainable architectures (Clean, MVVM) with GetX, Bloc, or Provider.',
        gradient: AppColors.accentGradient,
      ),
      _ServiceItem(
        icon: Icons.palette_rounded,
        title: 'UI/UX Design',
        description:
            'Designing responsive, adaptive, and interactive interfaces with custom widgets, animations, and Material 3.',
        gradient: AppColors.primaryGradient,
      ),
      _ServiceItem(
        icon: Icons.notifications_active_rounded,
        title: 'Real-Time Features',
        description:
            'Push & in-app notifications, live data updates, and background services for engagement.',
        gradient: AppColors.secondaryGradient,
      ),
      _ServiceItem(
        icon: Icons.check_circle_rounded,
        title: 'End-to-End Solutions',
        description:
            'I provide end-to-end mobile app development services, ensuring your vision is realized with precision and expertise.',
        gradient: AppColors.accentGradient,
      ),
    ];

    return ResponsiveLayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = Responsive.getCrossAxisCount(
          context,
        ).clamp(1, 3);

        const spacing = 20.0;
        final totalSpacing = spacing * (crossAxisCount - 1);
        final itemWidth =
            (constraints.maxWidth - totalSpacing) / crossAxisCount;
        final desiredHeight = Responsive.getValue(
          context,
          mobile: 220.0,
          tablet: 240.0,
          desktop: 260.0,
        );
        final aspectRatio = (itemWidth / desiredHeight).clamp(1.0, 2.0);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: aspectRatio,
          ),
          itemCount: services.length,
          itemBuilder: (_, i) => _ServiceCard(service: services[i]),
        );
      },
    );
  }
}

class _ServiceItem {
  final IconData icon;
  final String title;
  final String description;
  final LinearGradient gradient;

  const _ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
  });
}

class _ServiceCard extends StatefulWidget {
  final _ServiceItem service;

  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (_) => _hoverController.forward(),
            onExit: (_) => _hoverController.reverse(),
            child: Card(
              color: AppColors.surfaceDark,
              elevation: 6,
              shadowColor: AppColors.primary.withOpacity(.22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: AppColors.primary.withOpacity(.18)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        gradient: widget.service.gradient,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        widget.service.icon,
                        color: AppColors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.service.title,
                      style: AppTextStyles.h6.copyWith(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        widget.service.description,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textLight.withOpacity(.9),
                          height: 1.5,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
