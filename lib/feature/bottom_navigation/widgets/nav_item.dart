import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/bottom_navigation/bottom_navigation_controller.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

class NavItem extends GetView<BottomNavigationController> {
  const NavItem({
    super.key,
    required this.inActiveIcon,
    required this.activeIcon,
    required this.label,
    required this.index,
  });

  final IconData inActiveIcon;
  final IconData activeIcon;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isActive = controller.currentIndex.value == index;
      final color = isActive ? AppColors.primaryLight : AppColors.text50;

      return InkResponse(
        onTap: () => controller.changePage(index),
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: isActive
              ? Matrix4.translationValues(0, -2, 0)
              : Matrix4.identity(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isActive ? activeIcon : inActiveIcon,
                color: color,
                size: isActive ? 26 : 24,
              ),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
