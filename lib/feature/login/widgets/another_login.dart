import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template_flutter/gen/assets.gen.dart';
import 'package:template_flutter/utils/widgets/primary_button.dart';

class AnotherLogin extends StatelessWidget {
  const AnotherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(thickness: 1, color: colorScheme.outlineVariant),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Or login with',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            Expanded(
              child: Divider(thickness: 1, color: colorScheme.outlineVariant),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        PrimaryButton(
          text: 'Continue with Google',
          reverse: true,
          radius: 20,
          height: 48,
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.icons.icGoogleLogin.path,
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }
}
