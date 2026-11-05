import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupFromLogin extends StatelessWidget {
  const SignupFromLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
                ).textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
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
