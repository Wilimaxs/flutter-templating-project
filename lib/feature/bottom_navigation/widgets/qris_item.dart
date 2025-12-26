import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/bottom_navigation/bottom_navigation_controller.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

class QrisItem extends GetView<BottomNavigationController> {
  const QrisItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.changePage(2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
                  color: AppColors.primaryLight.withValues(alpha: 0.4),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
