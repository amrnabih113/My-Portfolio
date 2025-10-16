import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Hero section title with typewriter animation
class HeroTitle extends StatefulWidget {
  const HeroTitle({super.key});

  @override
  State<HeroTitle> createState() => _HeroTitleState();
}

class _HeroTitleState extends State<HeroTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _typewriterController;
  late Animation<int> _typewriterAnimation;

  final String _fullText = "Mobile App Developer";
  String _displayText = "";

  @override
  void initState() {
    super.initState();
    _setupTypewriterAnimation();
    _startTypewriterAnimation();
  }

  void _setupTypewriterAnimation() {
    _typewriterController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _typewriterAnimation = IntTween(begin: 0, end: _fullText.length).animate(
      CurvedAnimation(parent: _typewriterController, curve: Curves.easeInOut),
    );

    _typewriterAnimation.addListener(() {
      setState(() {
        _displayText = _fullText.substring(0, _typewriterAnimation.value);
      });
    });
  }

  void _startTypewriterAnimation() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) _typewriterController.forward();
    });
  }

  @override
  void dispose() {
    _typewriterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main name
        Text(
          'Amr Nabih',
          style: AppTextStyles.h1.copyWith(
            fontSize: Responsive.getResponsiveFontSize(
              context,
              mobile: 48,
              tablet: 64,
              desktop: 80,
            ),
            fontWeight: FontWeight.bold,
            color: AppColors.white,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 8),

        // Animated subtitle with cursor
        Row(
          children: [
            Text(
              _displayText,
              style: AppTextStyles.h2.copyWith(
                fontSize: Responsive.getResponsiveFontSize(
                  context,
                  mobile: 24,
                  tablet: 32,
                  desktop: 40,
                ),
                fontWeight: FontWeight.w400,
                color: AppColors.primary,
              ),
            ),
            // Blinking cursor
            AnimatedBuilder(
              animation: _typewriterController,
              builder: (context, child) {
                return Opacity(
                  opacity: _typewriterController.isAnimating
                      ? ((_typewriterController.value * 2) % 1.0 > 0.5
                            ? 1.0
                            : 0.0)
                      : 1.0,
                  child: Container(
                    width: 2,
                    height: Responsive.getResponsiveFontSize(
                      context,
                      mobile: 24,
                      tablet: 32,
                      desktop: 40,
                    ),
                    color: AppColors.primary,
                    margin: const EdgeInsets.only(left: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
