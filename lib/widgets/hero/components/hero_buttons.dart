import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Hero section action buttons
class HeroButtons extends StatefulWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;

  const HeroButtons({super.key, this.onViewWorkPressed, this.onContactPressed});

  @override
  State<HeroButtons> createState() => _HeroButtonsState();
}

class _HeroButtonsState extends State<HeroButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _setupButtonAnimation();
    _startButtonAnimation();
  }

  void _setupButtonAnimation() {
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOutCubic),
    );
  }

  void _startButtonAnimation() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) _buttonController.forward();
    });
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _buttonAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _buttonAnimation.value,
          child: Opacity(
            opacity: _buttonAnimation.value,
            child: Responsive.isMobile(context)
                ? _buildMobileButtons()
                : _buildDesktopButtons(),
          ),
        );
      },
    );
  }

  Widget _buildMobileButtons() {
    return Column(
      children: [
        _buildPrimaryButton(),
        const SizedBox(height: 16),
        _buildSecondaryButton(),
      ],
    );
  }

  Widget _buildDesktopButtons() {
    return Row(
      children: [
        _buildPrimaryButton(),
        const SizedBox(width: 24),
        _buildSecondaryButton(),
      ],
    );
  }

  Widget _buildPrimaryButton() {
    return ElevatedButton.icon(
      onPressed: widget.onViewWorkPressed,
      icon: const Icon(Icons.work_outline, color: AppColors.white),
      label: Text(
        'View My Work',
        style: AppTextStyles.buttonMedium.copyWith(
          color: AppColors.white,
          fontSize: Responsive.getResponsiveFontSize(
            context,
            mobile: 14,
            tablet: 16,
            desktop: 16,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 32 : 40,
          vertical: Responsive.isMobile(context) ? 16 : 20,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 8,
        shadowColor: AppColors.primary.withOpacity(0.3),
      ),
    );
  }

  Widget _buildSecondaryButton() {
    return OutlinedButton.icon(
      onPressed: widget.onContactPressed,
      icon: const Icon(Icons.mail_outline, color: AppColors.primary),
      label: Text(
        'Contact Me',
        style: AppTextStyles.buttonMedium.copyWith(
          color: AppColors.primary,
          fontSize: Responsive.getResponsiveFontSize(
            context,
            mobile: 14,
            tablet: 16,
            desktop: 16,
          ),
        ),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 32 : 40,
          vertical: Responsive.isMobile(context) ? 16 : 20,
        ),
        side: const BorderSide(color: AppColors.primary, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
