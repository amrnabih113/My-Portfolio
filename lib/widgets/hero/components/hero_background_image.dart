import 'package:flutter/material.dart';

/// Background image with parallax effect
class HeroBackgroundImage extends StatefulWidget {
  const HeroBackgroundImage({super.key});

  @override
  State<HeroBackgroundImage> createState() => _HeroBackgroundImageState();
}

class _HeroBackgroundImageState extends State<HeroBackgroundImage>
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
    _parallaxAnimation = Tween<double>(begin: -50, end: 50).animate(
      CurvedAnimation(parent: _parallaxController, curve: Curves.linear),
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
                  opacity: 0.3,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
