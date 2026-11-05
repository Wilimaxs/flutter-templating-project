import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter/gen/assets.gen.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const PrimaryAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      toolbarHeight: 64,
      title: Text(
        title,
        style: textTheme.titleLarge?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
      actions: actions,
      elevation: 2,
      leadingWidth: showBackButton ? null : 112,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              onPressed: onBackPressed ?? () => Get.back(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: AppSpacing.large),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Assets.images.imgLogo.image(
                  width: AppSpacing.huge,
                  height: AppSpacing.huge,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  semanticLabel: 'Logo Mythos Nusantara',
                ),
              ),
            ),
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
