import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter/feature/login/login_controller.dart';
import 'package:template_flutter/feature/login/widgets/another_login.dart';
import 'package:template_flutter/feature/login/widgets/form_login.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';
import 'package:template_flutter/utils/widgets/state_handle.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => StateHandle(
          isLoading: controller.isLoading.value,
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.large,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => FormLogin(
                        formKey: controller.loginFromKey,
                        obscurePassword: controller.obscurePassword.value,
                        onTogglePassword: controller.obscurePassword.toggle,
                        onSubmit: controller.login,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.extraLarge),
                    const AnotherLogin(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
