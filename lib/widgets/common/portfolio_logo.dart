import 'package:flutter/material.dart';
import '../../utils/utils.dart';

/// Portfolio logo widget
class PortfolioLogo extends StatelessWidget {
  final double? size;
  final bool showText;
  final Color? textColor;

  const PortfolioLogo({
    super.key,
    this.size,
    this.showText = true,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final logoSize = size ?? (Responsive.isMobile(context) ? 32 : 40);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo Icon
        Container(
          width: logoSize,
          height: logoSize,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.code_rounded,
            color: AppColors.white,
            size: logoSize * 0.6,
          ),
        ),

        // Logo Text - only show on larger screens
        if (showText &&
            !Responsive.isMobile(context) &&
            !Responsive.isTablet(context)) ...[
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              'Portfolio',
              style: AppTextStyles.h6.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor ?? AppColors.textPrimary,
                letterSpacing: -0.5,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}

/// Alternative text-based logo
class TextLogo extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const TextLogo({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? (Responsive.isMobile(context) ? 20 : 24),
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppColors.primary,
        letterSpacing: -0.5,
      ),
    );
  }
}

/// Animated logo with hover effect
class AnimatedLogo extends StatefulWidget {
  final double? size;
  final bool showText;
  final Color? textColor;

  const AnimatedLogo({
    super.key,
    this.size,
    this.showText = true,
    this.textColor,
  });

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppConstants.mediumAnimation,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logoSize = widget.size ?? (Responsive.isMobile(context) ? 32 : 40);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Animated Logo Icon
                  Container(
                    width: logoSize + 20,
                    height: logoSize + 20,
                    decoration: BoxDecoration(
                      // gradient: _isHovered
                      //     ? AppColors.secondaryGradient
                      //     : AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(8),
                      //   boxShadow: _isHovered
                      //       ? [
                      //           BoxShadow(
                      //             color: AppColors.primary.withValues(alpha: 0.3),
                      //             blurRadius: 8,
                      //             offset: const Offset(0, 4),
                      //           ),
                      //         ]
                      //       : null,
                      // ),
                    ),
                    child: Image.asset(
                      'assets/logos/logo.png',
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Logo Text - only show on desktop with enough space
                  // if (widget.showText &&
                  //     !Responsive.isMobile(context) &&
                  //     !Responsive.isTablet(context) &&
                  //     MediaQuery.of(context).size.width > 1000) ...[
                  //   const SizedBox(width: 12),
                  //   Flexible(
                  //     child: Text(
                  //       'Amr Nabih',
                  //       style: AppTextStyles.h6.copyWith(
                  //         fontWeight: FontWeight.bold,
                  //         color:
                  //             widget.textColor ??
                  //             (_isHovered
                  //                 ? AppColors.primary
                  //                 : AppColors.textLight),
                  //         letterSpacing: -0.5,
                  //       ),
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //   ),
                  //],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
