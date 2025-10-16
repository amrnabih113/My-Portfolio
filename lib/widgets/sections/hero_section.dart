import 'package:flutter/material.dart';
import '../../utils/utils.dart';

/// Hero section widget with responsive layout and animations
class HeroSection extends StatefulWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;

  const HeroSection({super.key, this.onViewWorkPressed, this.onContactPressed});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _buttonController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    // Fade animation for text content
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Slide animation for text content
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-0.5, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    // Scale animation for profile image
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // Button animation
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.bounceOut),
    );
  }

  void _startAnimations() {
    // Start animations in sequence
    _fadeController.forward();

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _slideController.forward();
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _scaleController.forward();
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) _buttonController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive.getValue(
        context,
        mobile: 600,
        tablet: 600,
        desktop: 700,
      ),
      decoration: const BoxDecoration(gradient: AppColors.darkHeroGradient),
      child: Stack(
        children: [
          // Background Image
          const _BackgroundImage(),

          // Dark overlay gradient
          const _DarkOverlay(),

          // Content
          Positioned.fill(
            child: Padding(
              padding: Responsive.getResponsivePadding(context),
              child: Responsive.isMobile(context)
                  ? _buildMobileLayout(context)
                  : _buildDesktopLayout(context),
            ),
          ),
        ],
      ),
    );
  }

  /// Mobile layout with image above text
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Animated Profile Image at the top for mobile
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: _ProfileImage(size: 200),
            );
          },
        ),
        const SizedBox(height: 24),

        // Animated Text Content below image
        AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: _HeroTextContent(
                  onViewWorkPressed: widget.onViewWorkPressed,
                  onContactPressed: widget.onContactPressed,
                  buttonAnimation: _buttonAnimation,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  /// Desktop layout with side-by-side content
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Animated Text Content
        Expanded(
          flex: 2,
          child: AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: _HeroTextContent(
                    onViewWorkPressed: widget.onViewWorkPressed,
                    onContactPressed: widget.onContactPressed,
                    buttonAnimation: _buttonAnimation,
                  ),
                ),
              );
            },
          ),
        ),

        // Animated Profile Image on the right for desktop
        const SizedBox(width: 32),
        Expanded(
          flex: 1,
          child: Center(
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: _ProfileImage(size: 300),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// Background image widget with parallax effect
class _BackgroundImage extends StatefulWidget {
  const _BackgroundImage();

  @override
  State<_BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<_BackgroundImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _parallaxController;
  late Animation<double> _parallaxAnimation;

  @override
  void initState() {
    super.initState();

    _parallaxController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _parallaxAnimation = Tween<double>(begin: -20, end: 20).animate(
      CurvedAnimation(parent: _parallaxController, curve: Curves.easeInOut),
    );

    _parallaxController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _parallaxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _parallaxAnimation,
      builder: (context, child) {
        return Positioned.fill(
          child: Transform.translate(
            offset: Offset(_parallaxAnimation.value, 0),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.3, // Makes the image subtle in the background
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Dark overlay gradient widget with animation
class _DarkOverlay extends StatefulWidget {
  const _DarkOverlay();

  @override
  State<_DarkOverlay> createState() => _DarkOverlayState();
}

class _DarkOverlayState extends State<_DarkOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 0.9).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryDark.withOpacity(
                    0.8 + (_pulseAnimation.value - 0.8) * 0.5,
                  ),
                  AppColors.secondaryDark.withOpacity(
                    0.85 + (_pulseAnimation.value - 0.8) * 0.5,
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

/// Profile image widget with animations
class _ProfileImage extends StatefulWidget {
  final double size;

  const _ProfileImage({required this.size});

  @override
  State<_ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<_ProfileImage>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _glowController;
  late Animation<double> _floatAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    // Floating animation
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    // Glow animation
    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _glowAnimation = Tween<double>(begin: 0.3, end: 0.6).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Start continuous animations
    _floatController.repeat(reverse: true);
    _glowController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_floatAnimation, _glowAnimation]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(_glowAnimation.value),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: AppColors.secondary.withOpacity(
                    _glowAnimation.value * 0.5,
                  ),
                  blurRadius: 20,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/profile.jpg', // Your main profile image
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 100,
                      color: AppColors.white,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Hero text content widget
class _HeroTextContent extends StatefulWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;
  final Animation<double> buttonAnimation;

  const _HeroTextContent({
    this.onViewWorkPressed,
    this.onContactPressed,
    required this.buttonAnimation,
  });

  @override
  State<_HeroTextContent> createState() => _HeroTextContentState();
}

class _HeroTextContentState extends State<_HeroTextContent>
    with TickerProviderStateMixin {
  late AnimationController _typewriterController;
  late AnimationController _nameController;
  late Animation<int> _typewriterAnimation;
  late Animation<double> _nameAnimation;
  final String _fullText = 'Hello There!';

  @override
  void initState() {
    super.initState();

    // Typewriter animation for "Hello There!"
    _typewriterController = AnimationController(
      duration: Duration(milliseconds: _fullText.length * 100),
      vsync: this,
    );
    _typewriterAnimation = IntTween(begin: 0, end: _fullText.length).animate(
      CurvedAnimation(parent: _typewriterController, curve: Curves.easeInOut),
    );

    // Name animation (Amr Mohamed Nabih)
    _nameController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _nameAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _nameController, curve: Curves.easeOutBack),
    );

    // Start animations in sequence
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _typewriterController.forward();
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) _nameController.forward();
    });
  }

  @override
  void dispose() {
    _typewriterController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // "Hello There!" with typewriter effect
        AnimatedBuilder(
          animation: _typewriterAnimation,
          builder: (context, child) {
            int currentIndex = _typewriterAnimation.value.clamp(
              0,
              _fullText.length,
            );
            String visibleText = _fullText.substring(0, currentIndex);
            return Text(
              visibleText + (currentIndex < _fullText.length ? '|' : ''),
              style: AppTextStyles.h3.copyWith(
                color: AppColors.secondary,
                fontSize: Responsive.getResponsiveFontSize(
                  context,
                  mobile: 24,
                  tablet: 28,
                  desktop: 32,
                ),
                fontWeight: FontWeight.w600,
              ),
              textAlign: Responsive.isMobile(context)
                  ? TextAlign.center
                  : TextAlign.start,
            );
          },
        ),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _nameAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                0,
                20 * (1 - _nameAnimation.value.clamp(0.0, 1.0)),
              ),
              child: Opacity(
                opacity: _nameAnimation.value.clamp(0.0, 1.0),
                child: Text(
                  'I am',
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: Responsive.getResponsiveFontSize(
                      context,
                      mobile: 18,
                      tablet: 22,
                      desktop: 26,
                    ),
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: Responsive.isMobile(context)
                      ? TextAlign.center
                      : TextAlign.start,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),

        // "Amr Mohamed Nabih" with scale animation
        AnimatedBuilder(
          animation: _nameAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _nameAnimation.value.clamp(0.0, 1.0),
              child: Opacity(
                opacity: _nameAnimation.value.clamp(0.0, 1.0),
                child: Text(
                  'Amr Mohamed Nabih',
                  style: AppTextStyles.h1.copyWith(
                    color: AppColors.white,
                    fontSize: Responsive.getResponsiveFontSize(
                      context,
                      mobile: 32,
                      tablet: 48,
                      desktop: 56,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: Responsive.isMobile(context)
                      ? TextAlign.center
                      : TextAlign.start,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),

        // Main description with slide animation
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1200),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: Text(
                  'Welcome to my portfolio, dive deep into a world of design, creativity, and Flutter-powered development.',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.white.withOpacity(0.9),
                    fontSize: Responsive.getResponsiveFontSize(
                      context,
                      mobile: 16,
                      tablet: 18,
                      desktop: 20,
                    ),
                    height: 1.6,
                  ),
                  textAlign: Responsive.isMobile(context)
                      ? TextAlign.center
                      : TextAlign.start,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 32),

        // Buttons with animation
        AnimatedBuilder(
          animation: widget.buttonAnimation,
          builder: (context, child) {
            double animationValue = widget.buttonAnimation.value.clamp(
              0.0,
              1.0,
            );
            return Transform.scale(
              scale: animationValue,
              child: Opacity(
                opacity: animationValue,
                child: _HeroButtons(
                  onViewWorkPressed: widget.onViewWorkPressed,
                  onContactPressed: widget.onContactPressed,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Hero action buttons widget with animations
class _HeroButtons extends StatefulWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;

  const _HeroButtons({this.onViewWorkPressed, this.onContactPressed});

  @override
  State<_HeroButtons> createState() => _HeroButtonsState();
}

class _HeroButtonsState extends State<_HeroButtons>
    with TickerProviderStateMixin {
  late AnimationController _hoverController1;
  late AnimationController _hoverController2;
  late Animation<double> _scaleAnimation1;
  late Animation<double> _scaleAnimation2;

  @override
  void initState() {
    super.initState();

    _hoverController1 = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _hoverController2 = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation1 = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _hoverController1, curve: Curves.easeInOut),
    );
    _scaleAnimation2 = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _hoverController2, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _hoverController1.dispose();
    _hoverController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            children: [
              AnimatedBuilder(
                animation: _scaleAnimation1,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation1.value,
                    child: MouseRegion(
                      onEnter: (_) => _hoverController1.forward(),
                      onExit: (_) => _hoverController1.reverse(),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: widget.onViewWorkPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                            elevation: 8,
                            shadowColor: AppColors.primary.withOpacity(0.4),
                          ),
                          child: Text(
                            'View My Work',
                            style: AppTextStyles.buttonMedium,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              AnimatedBuilder(
                animation: _scaleAnimation2,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation2.value,
                    child: MouseRegion(
                      onEnter: (_) => _hoverController2.forward(),
                      onExit: (_) => _hoverController2.reverse(),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: widget.onContactPressed,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.white,
                            side: const BorderSide(
                              color: AppColors.white,
                              width: 2,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                          ),
                          child: Text(
                            'Contact Me',
                            style: AppTextStyles.buttonMedium.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _scaleAnimation1,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation1.value,
                    child: MouseRegion(
                      onEnter: (_) => _hoverController1.forward(),
                      onExit: (_) => _hoverController1.reverse(),
                      child: ElevatedButton(
                        onPressed: widget.onViewWorkPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 14,
                          ),
                          elevation: 8,
                          shadowColor: AppColors.primary.withOpacity(0.4),
                        ),
                        child: Text(
                          'View My Work',
                          style: AppTextStyles.buttonMedium,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 16),
              AnimatedBuilder(
                animation: _scaleAnimation2,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation2.value,
                    child: MouseRegion(
                      onEnter: (_) => _hoverController2.forward(),
                      onExit: (_) => _hoverController2.reverse(),
                      child: OutlinedButton(
                        onPressed: widget.onContactPressed,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.white,
                          side: const BorderSide(
                            color: AppColors.white,
                            width: 2,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 14,
                          ),
                        ),
                        child: Text(
                          'Contact Me',
                          style: AppTextStyles.buttonMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
  }
}
