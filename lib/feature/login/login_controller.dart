import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:template_flutter/data/base/base_controller.dart';
import 'package:template_flutter/data/remote/extention_api_service.dart';
import 'package:template_flutter/data/remote/errorMapper/error_handler.dart';
import 'package:template_flutter/feature/auth/authentication.dart';

class LoginController extends BaseController {
  final loginFromKey = GlobalKey<FormBuilderState>();
  final _authService = Get.find<AuthenticationService>();

  Future<void> login() async {
    if (!(loginFromKey.currentState?.saveAndValidate() ?? false)) return;
    final values = loginFromKey.currentState!.value;
    final email = values['email'] ?? "";
    final password = values['Password'] ?? "";

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

      setLoading(false);

      if (response != null) {
        await _authService.saveAuthData(
          token: response.token ?? "",
          user: response.user!,
        );
      }
      showSuccessSnackbar(
        "Login Successful",
      );
    } catch (e) {
      setLoading(false);
      debugPrint("Login Error: $e");
      handleNetworkError(ErrorHandler.toNetworkException(e));
    }
  }
}
