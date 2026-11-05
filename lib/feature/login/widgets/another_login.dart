import 'package:flutter/material.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';
import 'package:template_flutter/utils/widgets/primary_button.dart';

class AnotherLogin extends StatelessWidget {
  const AnotherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: colorScheme.outlineVariant)),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.medium,
              ),
              child: Text(
                'METODE AKSES CEPAT',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 10,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            Expanded(child: Divider(color: colorScheme.outlineVariant)),
          ],
        ),
        const SizedBox(height: AppSpacing.medium),
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                text: 'Biometrik',
                onPressed: () {},
                reverse: true,
                height: 44,
                radius: 12,
                icon: Icon(
                  Icons.fingerprint,
                  color: colorScheme.primary,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.small),
            Expanded(
              child: PrimaryButton(
                text: 'Bypass',
                onPressed: () {},
                reverse: true,
                height: 44,
                radius: 12,
                icon: Icon(
                  Icons.lock_outline,
                  color: colorScheme.primary,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
