import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final double width;
  final double height;
  final bool reverse;
  final Widget? icon;
  final Color? textColor;
  final double? radius;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width = double.infinity,
    this.height = 46.0,
    this.reverse = false,
    this.icon,
    this.textColor,
    this.radius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final foregroundColor = reverse
        ? (textColor ?? colorScheme.onSurface)
        : (textColor ?? colorScheme.onPrimary);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: (enabled && !isLoading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: reverse
              ? colorScheme.surfaceContainerLow
              : colorScheme.primary,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: colorScheme.onSurface.withValues(
            alpha: 0.12,
          ),
          disabledForegroundColor: colorScheme.onSurface.withValues(
            alpha: 0.38,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8.0),
          ),
          side: BorderSide(
            color: reverse
                ? colorScheme.outlineVariant.withValues(alpha: 0.45)
                : colorScheme.primary,
            width: reverse ? 1 : 1.5,
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          splashFactory: NoSplash.splashFactory,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foregroundColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[icon!, const SizedBox(width: 8)],
                  Text(text),
                ],
              ),
      ),
    );
  }
}
