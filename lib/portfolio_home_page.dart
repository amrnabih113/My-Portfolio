import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../widgets/hero/hero.dart';
import '../widgets/about/about.dart';
import '../widgets/certifications/certifications.dart';
import '../widgets/footer/footer.dart';
import '../widgets/skills/skills.dart';
import '../widgets/experience/experience.dart';
import '../widgets/services/services.dart';
import '../widgets/sections/contact_section.dart';

/// Example page demonstrating the responsive AppBar
class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  String _activeSection = '/home';

  // Global keys for sections to enable smooth scrolling
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _certificationsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Navigation items for the AppBar/Drawer with scroll functionality
  late final List<NavItem> _navItems = [
    NavItem(
      title: 'Home',
      route: '/home',
      icon: Icons.home_rounded,
      onTap: () => _scrollToSection(_heroKey),
    ),
    NavItem(
      title: 'About',
      route: '/about',
      icon: Icons.person_rounded,
      onTap: () => _scrollToSection(_aboutKey),
    ),
    NavItem(
      title: 'Services',
      route: '/services',
      icon: Icons.design_services_rounded,
      onTap: () => _scrollToSection(_servicesKey),
    ),
    NavItem(
      title: 'Certifications',
      route: '/certifications',
      icon: Icons.school_rounded,
      onTap: () => _scrollToSection(_certificationsKey),
    ),
    NavItem(
      title: 'Skills',
      route: '/skills',
      icon: Icons.code_rounded,
      onTap: () => _scrollToSection(_skillsKey),
    ),
    NavItem(
      title: 'Experience',
      route: '/experience',
      icon: Icons.timeline_rounded,
      onTap: () => _scrollToSection(_experienceKey),
    ),
    NavItem(
      title: 'Contact',
      route: '/contact',
      icon: Icons.email_rounded,
      onTap: () => _scrollToSection(_contactKey),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Get the positions of all sections
    final sections = [
      {'route': '/home', 'key': _heroKey},
      {'route': '/about', 'key': _aboutKey},
      {'route': '/services', 'key': _servicesKey},
      {'route': '/certifications', 'key': _certificationsKey},
      {'route': '/skills', 'key': _skillsKey},
      {'route': '/experience', 'key': _experienceKey},
      {'route': '/contact', 'key': _contactKey},
    ];

    String? newActiveSection;

    for (var section in sections) {
      final key = section['key'] as GlobalKey;
      final route = section['route'] as String;
      final context = key.currentContext;

      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero).dy;
          final sectionHeight = renderBox.size.height;

          // Check if section is in viewport (with some offset for navbar)
          if (position <= 100 && position + sectionHeight > 100) {
            newActiveSection = route;
            break;
          }
        }
      }
    }

    // Update state if active section changed
    if (newActiveSection != null && newActiveSection != _activeSection) {
      setState(() {
        _activeSection = newActiveSection!;
      });
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onLogoTap() {
    _scrollToSection(_heroKey);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveNavigationLayout(
      navItems: _navItems,
      logo: const AnimatedLogo(showText: true),
      onLogoTap: _onLogoTap,
      activeSection: _activeSection,
      drawerFooter: [
        // Use only social links for drawer footer
        FooterSection(version: null),
      ],
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // Hero Section
          Container(
            key: _heroKey,
            child: HeroSection(
              onViewWorkPressed: () => _scrollToSection(_experienceKey),
              onContactPressed: () => _scrollToSection(_contactKey),
            ),
          ),

          // About Section
          Container(key: _aboutKey, child: const AboutSection()),

          // Services Section
          Container(key: _servicesKey, child: const ServicesSection()),

          // Certifications Section
          Container(
            key: _certificationsKey,
            child: const CertificationsSection(),
          ),

          // Skills Section
          Container(key: _skillsKey, child: const SkillsSection()),

          // Experience Section
          Container(key: _experienceKey, child: const ExperienceSection()),

          // Contact Section
          Container(key: _contactKey, child: const ContactSection()),

          // Footer
          FooterSection(),
        ],
      ),
    );
  }
}
