import 'package:flutter/material.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    this.containerColor,
    this.containerBorderColor,
    this.containerBorderSize = 1,
    this.shadowElevation = 0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.text,
    this.textStyle,
    this.icon,
    this.iconTint,
    this.iconSize = 24,
    this.iconSpacing = AppSpacing.small,
    this.contentDescription,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.small,
      vertical: AppSpacing.extraSmall,
    ),
  });

  final Color? containerColor;
  final Color? containerBorderColor;
  final double containerBorderSize;
  final double shadowElevation;
  final BorderRadiusGeometry borderRadius;
  final String? text;
  final TextStyle? textStyle;
  final Widget? icon;
  final Color? iconTint;
  final double iconSize;
  final double iconSpacing;
  final String? contentDescription;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedContainerColor =
        containerColor ?? colorScheme.surfaceContainerHigh;
    final resolvedBorderColor = containerBorderColor ?? colorScheme.outline;

    return Semantics(
      label: contentDescription,
      child: Material(
        color: resolvedContainerColor,
        elevation: shadowElevation,
        shadowColor: colorScheme.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(
            color: resolvedBorderColor,
            width: containerBorderSize,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: contentPadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null)
                IconTheme(
                  data: IconThemeData(color: iconTint, size: iconSize),
                  child: icon!,
                ),
              if (icon != null && text != null)
                SizedBox(width: iconSpacing),
              if (text != null)
                Text(
                  text!,
                  style: textStyle ?? Theme.of(context).textTheme.labelMedium,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
