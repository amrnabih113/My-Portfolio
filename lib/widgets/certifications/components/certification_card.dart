import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import 'certification_model.dart';

/// Individual certification card widget
class CertificationCard extends StatefulWidget {
  final CertificationModel certification;
  final Duration delay;

  const CertificationCard({
    super.key,
    required this.certification,
    required this.delay,
  });

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard>
    with TickerProviderStateMixin {
  late AnimationController _entryController;
  late AnimationController _hoverController;

  late Animation<double> _entryAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _entryAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _entryController, curve: Curves.easeOutCubic),
    );

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
    _elevationAnimation = Tween<double>(begin: 4.0, end: 12.0).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );

    // Start entry animation after delay
    Future.delayed(widget.delay, () {
      if (mounted) _entryController.forward();
    });
  }

  @override
  void dispose() {
    _entryController.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _entryAnimation,
        _scaleAnimation,
        _elevationAnimation,
      ]),
      builder: (context, child) {
        // Clamp animation values to prevent overflow
        double entryValue = _entryAnimation.value.clamp(0.0, 1.0);
        double scaleValue = (_entryAnimation.value * _scaleAnimation.value)
            .clamp(0.5, 1.1);

        return Transform.scale(
          scale: scaleValue,
          child: Opacity(
            opacity: entryValue,
            child: MouseRegion(
              onEnter: (_) => _hoverController.forward(),
              onExit: (_) => _hoverController.reverse(),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  Responsive.getValue(
                    context,
                    mobile: 20,
                    tablet: 24,
                    desktop: 28,
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: widget.certification.color.withOpacity(0.18),
                      blurRadius: _elevationAnimation.value * 0.9,
                      offset: Offset(0, _elevationAnimation.value / 3),
                      spreadRadius: 1,
                    ),
                  ],
                  border: Border.all(
                    color: widget.certification.color.withOpacity(0.22),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with icon and year
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon container
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                widget.certification.color.withOpacity(0.1),
                                widget.certification.color.withOpacity(0.2),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            widget.certification.icon,
                            size: 28,
                            color: widget.certification.color,
                          ),
                        ),

                        const Spacer(),

                        // Year badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: widget.certification.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: widget.certification.color.withOpacity(
                                0.2,
                              ),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            widget.certification.year,
                            style: AppTextStyles.caption.copyWith(
                              color: widget.certification.color,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Title
                    Text(
                      widget.certification.title,
                      style: AppTextStyles.h5.copyWith(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.w700,
                        fontSize: Responsive.getResponsiveFontSize(
                          context,
                          mobile: 18,
                          tablet: 20,
                          desktop: 22,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Provider
                    Text(
                      widget.certification.provider,
                      style: AppTextStyles.subtitle2.copyWith(
                        color: widget.certification.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Description
                    Text(
                      widget.certification.description,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textLight.withOpacity(0.9),
                        height: 1.6,
                        fontSize: Responsive.getResponsiveFontSize(
                          context,
                          mobile: 13,
                          tablet: 14,
                          desktop: 14,
                        ),
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
