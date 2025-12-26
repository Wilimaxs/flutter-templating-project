import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color titleColor;
  final Color iconColor;
  final double elevation;
  final bool centerTitle;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const PrimaryAppBar({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
    this.titleColor = AppColors.text10,
    this.iconColor = AppColors.primaryLight,
    this.elevation = 1,
    this.centerTitle = true,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      actions: actions,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios_new, size: 20, color: iconColor),
              onPressed: onBackPressed ?? () => Get.back(),
            )
          : null,
      bottom: bottom,
      backgroundColor: AppColors.white,
      elevation: elevation,
      shadowColor: AppColors.text20,
      centerTitle: centerTitle,
      iconTheme: IconThemeData(color: iconColor),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
