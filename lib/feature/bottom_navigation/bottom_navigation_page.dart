import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/bottom_navigation/widgets/nav_item.dart';
import 'package:ppob_koperasi_payment/feature/bottom_navigation/widgets/qris_item.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

import 'bottom_navigation_controller.dart';

class BottomNavigationPage extends GetView<BottomNavigationController> {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              Center(child: Text('Home')),
              Center(child: Text('Activity')),
              Center(child: Text('Qris Page')),
              Center(child: Text('Koperasi')),
              Center(child: Text('Profile')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 10,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.text50,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Right Side
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavItem(
                      inActiveIcon: Icons.home_outlined,
                      activeIcon: Icons.home,
                      label: 'Home',
                      index: 0,
                    ),
                    NavItem(
                      inActiveIcon: Icons.assignment_outlined,
                      activeIcon: Icons.assignment,
                      label: 'Activity',
                      index: 1,
                    ),
                  ],
                ),
              ),

              QrisItem(),

              // Left Side
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavItem(
                      inActiveIcon: Icons.account_balance_wallet_outlined,
                      activeIcon: Icons.account_balance_wallet,
                      label: 'Koperasi',
                      index: 3,
                    ),
                    NavItem(
                      inActiveIcon: Icons.person_outline,
                      activeIcon: Icons.person,
                      label: 'Profile',
                      index: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
