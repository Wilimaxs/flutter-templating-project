import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter/feature/bottom_navigation/widgets/nav_item.dart';
import 'package:template_flutter/feature/home/home_page.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';

import 'bottom_navigation_controller.dart';

class BottomNavigationPage extends GetView<BottomNavigationController> {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final capsuleRadius = BorderRadius.circular(100);

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              HomePage(),
              Center(child: Text('Map')),
              Center(child: Text('Saved')),
              Center(child: Text('Profile')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => SafeArea(
          top: false,
          child: Container(
            margin: const EdgeInsets.fromLTRB(
              AppSpacing.large,
              0,
              AppSpacing.large,
              AppSpacing.small,
            ),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: capsuleRadius,
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.small,
              vertical: AppSpacing.extraSmall,
            ),
            child: Row(
              children: [
                Expanded(
                  child: NavItem(
                    activeIcon: Icons.explore,
                    inactiveIcon: Icons.explore_outlined,
                    label: 'Explore',
                    isActive: controller.currentIndex.value == 0,
                    onTap: () => controller.changePage(0),
                  ),
                ),
                Expanded(
                  child: NavItem(
                    activeIcon: Icons.location_on,
                    inactiveIcon: Icons.location_on_outlined,
                    label: 'Map',
                    isActive: controller.currentIndex.value == 1,
                    onTap: () => controller.changePage(1),
                  ),
                ),
                Expanded(
                  child: NavItem(
                    activeIcon: Icons.bookmark,
                    inactiveIcon: Icons.bookmark_border,
                    label: 'Saved',
                    isActive: controller.currentIndex.value == 2,
                    onTap: () => controller.changePage(2),
                  ),
                ),
                Expanded(
                  child: NavItem(
                    activeIcon: Icons.person,
                    inactiveIcon: Icons.person_outline,
                    label: 'Profile',
                    isActive: controller.currentIndex.value == 3,
                    onTap: () => controller.changePage(3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
