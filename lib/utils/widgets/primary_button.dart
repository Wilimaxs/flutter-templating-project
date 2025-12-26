import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

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
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: (enabled && !isLoading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: reverse
              ? AppColors.white
              : AppColors.primaryLight,
          foregroundColor: reverse
          ? (textColor ?? AppColors.black)
              : (textColor ?? AppColors.white),
          disabledBackgroundColor: AppColors.text30,
          disabledForegroundColor: AppColors.text50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12.0),
          ),
          side: BorderSide(
            color: reverse ? AppColors.outlineDark : AppColors.primaryContainerLight,
            width: 1.5,
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
            ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.white,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(text),
          ],
        ),
      ),
    );
  }
}