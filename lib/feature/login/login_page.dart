import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/feature/login/widgets/form_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 86.0),
              Text(
                'Login to your Account',
                style: Theme.of(context).textTheme.displayLarge,
                softWrap: true,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Log in to your account using your cooperative membership credentials.',
                style: Theme.of(context).textTheme.bodyLarge,
                softWrap: true,
              ),
              const SizedBox(height: 24.0),
              // The form login widget would be placed here
              const FormLogin()
            ],
          ),
        ),
      ),
    );
  }
}
