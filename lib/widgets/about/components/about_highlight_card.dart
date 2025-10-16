import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import 'about_highlights.dart';

/// Individual highlight card widget
class AboutHighlightCard extends StatefulWidget {
  final HighlightModel highlight;

  const AboutHighlightCard({super.key, required this.highlight});

  @override
  State<AboutHighlightCard> createState() => _AboutHighlightCardState();
}

class _AboutHighlightCardState extends State<AboutHighlightCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
    _elevationAnimation = Tween<double>(begin: 2.0, end: 8.0).animate(
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
      animation: Listenable.merge([_scaleAnimation, _elevationAnimation]),
      builder: (context, child) {
        // Clamp animation values to prevent overflow
        double scaleValue = _scaleAnimation.value.clamp(0.8, 1.1);
        double elevationValue = _elevationAnimation.value.clamp(2.0, 12.0);

        return Transform.scale(
          scale: scaleValue,
          child: MouseRegion(
            onEnter: (_) => _hoverController.forward(),
            onExit: (_) => _hoverController.reverse(),
            child: Container(
              padding: EdgeInsets.all(
                Responsive.getValue(
                  context,
                  mobile: 16,
                  tablet: 18,
                  desktop: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: widget.highlight.color.withOpacity(0.12),
                    blurRadius: elevationValue * 1.6,
                    offset: Offset(0, elevationValue * 0.6),
                    spreadRadius: 0.5,
                  ),
                ],
                border: Border.all(
                  color: widget.highlight.color.withOpacity(0.18),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon with background
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          widget.highlight.color.withOpacity(0.1),
                          widget.highlight.color.withOpacity(0.2),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      widget.highlight.icon,
                      size: 28,
                      color: widget.highlight.color,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Title
                  Text(
                    widget.highlight.title,
                    style: AppTextStyles.h6.copyWith(
                      color: AppColors.textLight,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  // Description
                  Text(
                    widget.highlight.description,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textLight.withOpacity(0.9),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
