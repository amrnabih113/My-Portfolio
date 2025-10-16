import 'package:flutter/material.dart';
import '../../utils/utils.dart';

/// Navigation item model for the portfolio
class NavItem {
  final String title;
  final String route;
  final IconData? icon;
  final VoidCallback? onTap;

  const NavItem({
    required this.title,
    required this.route,
    this.icon,
    this.onTap,
  });
}

/// Responsive AppBar that turns into a drawer on small screens
class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<NavItem> navItems;
  final Widget? logo;
  final bool showTitle;
  final VoidCallback? onLogoTap;
  final String? activeSection;

  const ResponsiveAppBar({
    super.key,
    required this.navItems,
    this.logo,
    this.showTitle = true,
    this.onLogoTap,
    this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.textLight,
      elevation: 0,
      scrolledUnderElevation: 2,
      shadowColor: AppColors.primary.withOpacity(0.2),
      toolbarHeight: 70,
      leadingWidth: Responsive.isMobile(context) ? 56 : null,
      leading: Responsive.isMobile(context)
          ? Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu_rounded),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: 'Menu',
              ),
            )
          : null,
      title: _buildTitle(context),
      actions: Responsive.isMobile(context)
          ? null
          : _buildDesktopActions(context),
      automaticallyImplyLeading: Responsive.isMobile(context),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (logo != null) ...[
          Flexible(
            child: GestureDetector(onTap: onLogoTap, child: logo!),
          ),
        ],
      ],
    );
  }

  List<Widget> _buildDesktopActions(BuildContext context) {
    return [
      ...navItems.map(
        (item) => _NavButton(item: item, isActive: activeSection == item.route),
      ),
      const SizedBox(width: 16),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

/// Navigation button for desktop view
class _NavButton extends StatefulWidget {
  final NavItem item;
  final bool isActive;

  const _NavButton({required this.item, this.isActive = false});

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppConstants.shortAnimation,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MouseRegion(
        onEnter: (_) {
          setState(() => _isHovered = true);
          _animationController.forward();
        },
        onExit: (_) {
          setState(() => _isHovered = false);
          _animationController.reverse();
        },
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: widget.isActive
                      ? AppColors.primary.withOpacity(0.2)
                      : _isHovered
                      ? AppColors.primary.withOpacity(0.08)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: widget.isActive
                      ? Border.all(color: AppColors.primary, width: 2)
                      : null,
                ),
                child: TextButton(
                  onPressed: widget.item.onTap,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    widget.item.title,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: widget.isActive
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: widget.isActive
                          ? AppColors.primary
                          : _isHovered
                          ? AppColors.textLight
                          : AppColors.textLight.withOpacity(0.85),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Responsive drawer for mobile screens
class ResponsiveDrawer extends StatelessWidget {
  final List<NavItem> navItems;
  final Widget? logo;
  final Widget? header;
  final List<Widget>? footerItems;
  final VoidCallback? onLogoTap;
  final String? activeSection;

  const ResponsiveDrawer({
    super.key,
    required this.navItems,
    this.logo,
    this.header,
    this.footerItems,
    this.onLogoTap,
    this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.surfaceDark.withOpacity(0.85),
              AppColors.surfaceDark.withOpacity(0.95),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.12),
              blurRadius: 32,
              offset: Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: AppColors.primary.withOpacity(0.18),
            width: 2,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header Section
              _buildHeader(context),

              // Navigation Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  children: [
                    ...navItems.map(
                      (item) => _DrawerItem(
                        item: item,
                        isActive: activeSection == item.route,
                      ),
                    ),
                  ],
                ),
              ),

              // Footer Section
              if (footerItems != null) ...[
                const Divider(color: AppColors.greyLight),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: footerItems!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(gradient: AppColors.primaryGradient),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (logo != null) ...[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                onLogoTap?.call();
              },
              child: logo!,
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

/// Drawer item widget
class _DrawerItem extends StatelessWidget {
  final NavItem item;
  final bool isActive;

  const _DrawerItem({required this.item, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.icon != null
          ? Icon(
              item.icon,
              color: isActive
                  ? AppColors.primary
                  : AppColors.primary.withOpacity(0.8),
              size: 22,
            )
          : null,
      title: Text(
        item.title,
        style: AppTextStyles.bodyMedium.copyWith(
          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          color: isActive ? AppColors.primary : AppColors.textLight,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(); // Close drawer
        item.onTap?.call();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      hoverColor: AppColors.primary.withOpacity(0.1),
      tileColor: isActive
          ? AppColors.primary.withOpacity(0.15)
          : Colors.transparent,
    );
  }
}

/// Complete responsive navigation layout
class ResponsiveNavigationLayout extends StatelessWidget {
  final List<NavItem> navItems;
  final Widget body;
  final Widget? logo;
  final Widget? drawerHeader;
  final List<Widget>? drawerFooter;
  final VoidCallback? onLogoTap;
  final bool showTitle;
  final String? activeSection;

  const ResponsiveNavigationLayout({
    super.key,
    required this.navItems,
    required this.body,
    this.logo,
    this.drawerHeader,
    this.drawerFooter,
    this.onLogoTap,
    this.showTitle = true,
    this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveAppBar(
        navItems: navItems,
        logo: logo,
        showTitle: showTitle,
        onLogoTap: onLogoTap,
        activeSection: activeSection,
      ),
      drawer: Responsive.isMobile(context)
          ? ResponsiveDrawer(
              navItems: navItems,
              logo: logo,
              header: drawerHeader,
              footerItems: drawerFooter,
              onLogoTap: onLogoTap,
              activeSection: activeSection,
            )
          : null,
      body: body,
    );
  }
}
