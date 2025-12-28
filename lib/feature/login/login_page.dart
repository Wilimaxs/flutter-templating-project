import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/feature/login/widgets/another_login.dart';
import 'package:ppob_koperasi_payment/feature/login/widgets/form_login.dart';
import 'package:ppob_koperasi_payment/feature/login/widgets/signup_from_login.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              // Form Login
              const FormLogin(),
              const SizedBox(height: 24.0),
              // Another Login
              const AnotherLogin(),
              const SizedBox(height: 24.0),
              const SignupFromLogin(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 24.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Koperasi Sukasenang",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Jl. Anggrek Raya No. 17 RT 02/RW 05, Kel. Cipadung, Kec. Ujungberung, Kota Bandung, Prov. Jawa Barat",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.text70,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
