import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? titleColor;
  final Color? iconColor;
  final double elevation;
  final bool centerTitle;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const PrimaryAppBar({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
    this.titleColor,
    this.iconColor,
    this.elevation = 1,
    this.centerTitle = true,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(
          color: titleColor ?? colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: iconColor ?? colorScheme.onSurface,
              ),
              onPressed: onBackPressed ?? () => Get.back(),
            )
          : null,
      bottom: bottom,
      backgroundColor: colorScheme.surface,
      elevation: elevation,
      shadowColor: colorScheme.shadow.withValues(alpha: 0.08),
      centerTitle: centerTitle,
      iconTheme: IconThemeData(color: iconColor ?? colorScheme.onSurface),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
