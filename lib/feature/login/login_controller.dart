import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:template_flutter/data/base/base_controller.dart';
import 'package:template_flutter/data/remote/errorMapper/error_handler.dart';
import 'package:template_flutter/data/remote/extention_api_service.dart';
import 'package:template_flutter/feature/auth/authentication.dart';

class LoginController extends BaseController {
  static const String _demoEmail = 'demo@example.com';
  static const String _demoPassword = 'password123';

  final _authService = Get.find<AuthenticationService>();

  final loginFromKey = GlobalKey<FormBuilderState>();
  final obscurePassword = true.obs;

  Future<void> login() async {
    if (!(loginFromKey.currentState?.saveAndValidate() ?? false)) return;
    final values = loginFromKey.currentState!.value;
    final email = values['email'] ?? "";
    final password = values['Password'] ?? "";

    await _loginWithCredentials(email: email, password: password);
  }

  Future<void> bypassLogin() => _loginWithCredentials(
    email: _demoEmail,
    password: _demoPassword,
  );

  Future<void> _loginWithCredentials({
    required String email,
    required String password,
  }) async {
    hideKeyboard();
    setLoading(true);

    try {
      final response = await apiService
          .login(
            email: email,
            password: password,
            cancelToken: requestCancelToken,
          )
          .validateResponse;

      await _authService.saveAuthData(
        token: response.token ?? "",
        user: response.user!,
      );
      showSuccessSnackbar("Login Successful");
    } catch (e) {
      debugPrint("Login Error: $e");
      handleNetworkError(ErrorHandler.toNetworkException(e));
    } finally {
      setLoading(false);
    }
  }
}
