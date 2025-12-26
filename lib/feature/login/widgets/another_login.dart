import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppob_koperasi_payment/gen/assets.gen.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';
import 'package:ppob_koperasi_payment/utils/widgets/primary_button.dart';

class AnotherLogin extends StatelessWidget {
  const AnotherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(thickness: 1, color: AppColors.text60),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Or login with',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.text60),
              ),
            ),
            const Expanded(
              child: Divider(thickness: 1, color: AppColors.text60),
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
