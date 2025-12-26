import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

class SignupFromLogin extends StatelessWidget {
  const SignupFromLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: 'Sign Up',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.primaryLight),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to Sign Up page
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
