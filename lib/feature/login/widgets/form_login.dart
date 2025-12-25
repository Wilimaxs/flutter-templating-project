import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';
import 'package:ppob_koperasi_payment/utils/widgets/custom_text_field.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          name: 'email',
          label: 'Email',
          required: true,
          hint: 'Enter your email',
        ),
        const SizedBox(height: 16.0),
        CustomTextField(
          name: 'Password',
          label: 'Password',
          required: true,
          hint: 'Enter your password',
          obscureText: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.visibility_off),
            onPressed: () {},
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
          ),
        ),
      ],
    );
  }
}
