import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter/feature/login/login_controller.dart';
import 'package:template_flutter/feature/login/widgets/another_login.dart';
import 'package:template_flutter/feature/login/widgets/form_login.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => FormLogin(
                    formKey: controller.loginFromKey,
                    isLoading: controller.isLoading.value,
                    obscurePassword: controller.obscurePassword.value,
                    onTogglePassword: controller.obscurePassword.toggle,
                    onSubmit: controller.login,
                  ),
                ),
                const SizedBox(height: 20),
                const AnotherLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
