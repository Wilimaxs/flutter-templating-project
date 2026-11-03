import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:template_flutter/feature/login/login_controller.dart';
import 'package:template_flutter/utils/theme/app_color.dart';
import 'package:template_flutter/utils/widgets/custom_text_field.dart';
import 'package:template_flutter/utils/widgets/primary_button.dart';

class FormLogin extends GetView<LoginController> {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.loginFromKey,
      child: Column(
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
          const SizedBox(height: 24.0),
          PrimaryButton(
            text: 'Login',
            onPressed: () {
              controller.login();
              // Get.offAllNamed(Routes.bottomNavigation);
            },
          ),
        ],
      ),
    );
  }
}
