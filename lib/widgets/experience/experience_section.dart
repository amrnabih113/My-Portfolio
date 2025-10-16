import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../models/experience.dart';

/// Experience section showcasing freelance work and focus areas
class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideUpAnimation;
  bool _didPrecache = false;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didPrecache) return;
    // Pre-cache project poster images to ensure they appear promptly and catch missing assets
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      for (final p in _projectsPosters) {
        precacheImage(AssetImage(p.imageAsset), context).catchError((_) {});
      }
      _didPrecache = true;
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
              child: const _ExperienceSectionTitle(),
            ),
            const SizedBox(height: 36),
            SlideTransition(
              position: _slideUpAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: const _ExperienceHighlightCards(),
              ),
            ),
            const SizedBox(height: 40),
            SlideTransition(
              position: _slideUpAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: _ExperienceTimeline(experiences: _data),
              ),
            ),
            const SizedBox(height: 48),

            // Projects Posters
            SlideTransition(
              position: _slideUpAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: const _ProjectsSection(),
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class _ExperienceSectionTitle extends StatelessWidget {
  const _ExperienceSectionTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Experience',
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
          'Amr Nabih • Freelance Flutter Developer',
          style: AppTextStyles.subtitle2.copyWith(color: AppColors.textLight),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ExperienceHighlightCards extends StatelessWidget {
  const _ExperienceHighlightCards();

  @override
  Widget build(BuildContext context) {
    final cards = const [
      _Highlight(
        icon: Icons.shopping_cart,
        title: 'E-commerce',
        desc: 'Creating intuitive shopping experiences.',
      ),
      _Highlight(
        icon: Icons.savings,
        title: 'Finance',
        desc: 'Developing secure and efficient financial tools.',
      ),
      _Highlight(
        icon: Icons.groups,
        title: 'Community',
        desc: 'Fostering engagement and connection.',
      ),
      _Highlight(
        icon: Icons.psychology_rounded,
        title: 'AI Integration',
        desc: 'Integrating intelligent AI-powered features.',
      ),
      _Highlight(
        icon: Icons.school_rounded,
        title: 'Educational Platforms',
        desc: 'Building engaging learning experiences.',
      ),
      _Highlight(
        icon: Icons.chat_bubble_rounded,
        title: 'Social Media',
        desc: 'Crafting interactive social experiences.',
      ),
    ];

    return ResponsiveLayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = Responsive.getCrossAxisCount(
          context,
        ).clamp(1, 6);

        // Compute a nicer aspect ratio based on available width
        const spacing = 20.0;
        final totalSpacing = spacing * (crossAxisCount - 1);
        final itemWidth =
            (constraints.maxWidth - totalSpacing) / crossAxisCount;
        final desiredHeight = Responsive.getValue(
          context,
          mobile: 180.0,
          tablet: 200.0,
          desktop: 220.0,
        );
        final aspectRatio = (itemWidth / desiredHeight).clamp(1.2, 2.2);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: aspectRatio,
          ),
          itemCount: cards.length,
          itemBuilder: (_, i) => _HighlightCard(highlight: cards[i]),
        );
      },
    );
  }
}

class _Highlight {
  final IconData icon;
  final String title;
  final String desc;
  const _Highlight({
    required this.icon,
    required this.title,
    required this.desc,
  });
}

class _HighlightCard extends StatelessWidget {
  final _Highlight highlight;
  const _HighlightCard({required this.highlight});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surfaceDark,
      elevation: 4,
      shadowColor: AppColors.primary.withOpacity(.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.primary.withOpacity(.15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: AppColors.secondaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(highlight.icon, color: AppColors.white, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              highlight.title,
              style: AppTextStyles.h5.copyWith(color: AppColors.textLight),
            ),
            const SizedBox(height: 8),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                highlight.desc,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textLight.withOpacity(.85),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceTimeline extends StatelessWidget {
  final List<Experience> experiences;
  const _ExperienceTimeline({required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primary.withOpacity(.2)),
          ),
          child: Text(
            'My focus areas include: Firebase auth, real-time DBs, REST APIs • Performance & responsive UI • Seamless user journeys',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 24),
        ...experiences.map((e) => _ExperienceTile(exp: e)).toList(),
      ],
    );
  }
}

class _ExperienceTile extends StatelessWidget {
  final Experience exp;
  const _ExperienceTile({required this.exp});

  @override
  Widget build(BuildContext context) {
    final chipBg = AppColors.primary.withOpacity(.12);
    final chipBorder = AppColors.primary.withOpacity(.25);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyDark.withOpacity(.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.work_history_rounded,
                color: AppColors.secondary,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${exp.position} — ${exp.company}',
                  style: AppTextStyles.h5.copyWith(color: AppColors.textLight),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${exp.formattedDateRange} • ${exp.employmentType.displayName}${exp.location != null ? ' • ${exp.location}' : ''}',
            style: AppTextStyles.subtitle2.copyWith(
              color: AppColors.textLight.withOpacity(.8),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            exp.description,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textLight.withOpacity(.95),
            ),
          ),
          if (exp.responsibilities.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: exp.responsibilities
                  .map((r) => _Chip(text: r, bg: chipBg, border: chipBorder))
                  .toList(),
            ),
          ],
          if (exp.technologies.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: exp.technologies
                  .map(
                    (t) => _Chip(
                      text: t,
                      bg: AppColors.secondary.withOpacity(.12),
                      border: AppColors.secondary.withOpacity(.25),
                    ),
                  )
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final Color bg;
  final Color border;
  const _Chip({required this.text, required this.bg, required this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(color: AppColors.textLight),
      ),
    );
  }
}

// Data mapping for provided content
final List<Experience> _data = [
  Experience(
    id: 'freelance-2023',
    company: 'Self-employed',
    position: 'Freelance Mobile App Developer',
    description:
        "As a freelance Flutter developer, I've built a diverse portfolio of cross‑platform apps across sectors.",
    startDate: DateTime(2023, 1, 1),
    endDate: null,
    isCurrent: true,
    location: 'Remote',
    employmentType: EmploymentType.freelance,
    responsibilities: const [
      'Firebase authentication, real-time databases, and REST API integration',
      'Performance optimization and responsive UI design',
      'Crafting seamless user journeys for enhanced satisfaction',
    ],
    achievements: const [],
    technologies: const [
      'Flutter',
      'Dart',
      'Firebase',
      'Cloud Functions',
      'Provider/Bloc',
      'REST/JSON',
    ],
  ),
];

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Projects',
          style: AppTextStyles.h3.copyWith(color: AppColors.textLight),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        _ProjectsGrid(projects: _projectsPosters),
      ],
    );
  }
}

class _ProjectPoster {
  final String title;
  final String imageAsset;
  final List<String> technologies;
  final String description;
  const _ProjectPoster({
    required this.title,
    required this.imageAsset,
    required this.technologies,
    required this.description,
  });
}

class _ProjectsGrid extends StatelessWidget {
  final List<_ProjectPoster> projects;
  const _ProjectsGrid({required this.projects});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = Responsive.getCrossAxisCount(
          context,
        ).clamp(1, 3);
        const spacing = 16.0;
        final totalSpacing = spacing * (crossAxisCount - 1);
        final itemWidth =
            (constraints.maxWidth - totalSpacing) / crossAxisCount;

        // Image height based on 16:9 poster inside the card
        final imageHeight = itemWidth * 9 / 16;
        // Estimated content height (title, desc, chips + paddings)
        final contentHeight = Responsive.getValue(
          context,
          // Slightly higher to accommodate wrapped tags (keywords)
          mobile: 140.0,
          tablet: 150.0,
          desktop: 160.0,
        );
        final desiredHeight = imageHeight + contentHeight;
        final aspectRatio = (itemWidth / desiredHeight).clamp(0.8, 1.3);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (_, i) => _ProjectPosterCard(project: projects[i]),
        );
      },
    );
  }
}

class _ProjectPosterCard extends StatelessWidget {
  final _ProjectPoster project;
  const _ProjectPosterCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surfaceDark,
      elevation: 6,
      shadowColor: AppColors.secondary.withOpacity(.25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          // Poster image
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    image: AssetImage(project.imageAsset),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_rounded,
                            color: AppColors.white.withOpacity(.9),
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                  // Subtle overlay
                  Container(color: Colors.black.withOpacity(.15)),
                ],
              ),
            ),
          ),

          // Content
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: AppTextStyles.h6.copyWith(
                      color: AppColors.textLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    project.description,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textLight.withOpacity(.9),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.technologies
                        .map(
                          (t) => _Tag(
                            text: t,
                            bg: AppColors.accent.withOpacity(.12),
                            border: AppColors.accent.withOpacity(.25),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Smaller tag chip for project keywords
class _Tag extends StatelessWidget {
  final String text;
  final Color bg;
  final Color border;
  const _Tag({required this.text, required this.bg, required this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textLight,
          fontSize: 11,
        ),
      ),
    );
  }
}

// Posters data (assets to be added under assets/images/projects/)
const List<_ProjectPoster> _projectsPosters = [
  _ProjectPoster(
    title: 'SmartFin (Budget Tracker)',
    imageAsset: 'assets/projects/smartFin.jpg',
    technologies: ['Clean Arch', 'SQLite', 'Sync'],
    description:
        'Budgeting, expense tracking, insights with clean UI and secure handling.',
  ),
  _ProjectPoster(
    title: 'A-Store (E-Commerce)',
    imageAsset: 'assets/projects/A-Store.jpg',
    technologies: ['Supabase', 'GetX', 'MVVM', 'Auth'],
    description:
        'Feature-rich shopping experience with modern UI and robust functionality.',
  ),
  _ProjectPoster(
    title: 'FriendFur (Pet Adoption)',
    imageAsset: 'assets/projects/furfriends.jpg',
    technologies: ['Firebase', 'GetX', 'Onboarding'],
    description:
        'Discover and adopt pets, connect with community, share stories.',
  ),
  _ProjectPoster(
    title: 'Knowva (AI Educational Assistant)',
    imageAsset: 'assets/projects/knowva.jpg',
    technologies: ['GetX', 'Dio', 'GetStorage', 'intl'],
    description:
        'M3 UI, responsive layouts, APIs, storage, media pickers, notifications.',
  ),
];
