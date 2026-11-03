import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter/feature/bottom_navigation/bottom_navigation_controller.dart';
import 'package:template_flutter/utils/theme/app_color.dart';

class QrisItem extends GetView<BottomNavigationController> {
  const QrisItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isActive = controller.currentIndex.value == 2;

      return InkResponse(
        onTap: () => controller.changePage(2),
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(0, isActive ? 4 : 0, 0),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryLight.withValues(
                    alpha: isActive ? 0.2 : 0.4,
                  ),
                  blurRadius: isActive ? 4 : 10,
                  spreadRadius: isActive ? 0 : 2,
                  offset: isActive ? const Offset(0, 1) : const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.qr_code_scanner,
              color: isActive
                  ? Colors.white.withValues(alpha: 0.8)
                  : Colors.white,
              size: 28,
            ),
          ),
        ),
      );
    });
  }
}
