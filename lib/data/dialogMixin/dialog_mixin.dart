import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DialogMixin {

  /// Base method for show snackbar
  void _showSnackbar(
    String title,
    String message,
    Color bgColor,
    IconData icon,
  ) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      colorText: Colors.white,
      icon: Icon(icon, color: Colors.white),
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 3),
    );
  }

  // Show success snackbar (green)
  void showSuccessSnackbar(String message) {
    _showSnackbar("Success", message, Colors.green, Icons.check_circle);
  }

  // Show errorMapper snackbar (red)
  void showErrorSnackbar(String message) {
    _showSnackbar("Error", message, Colors.red, Icons.error);
  }

  // Show warning snackbar (orange)
  void showWarningSnackbar(String message) {
    _showSnackbar("Warning", message, Colors.orange, Icons.warning);
  }

  // Show info snackbar (blue)
  void showInfoSnackbar(String message) {
    _showSnackbar("Info", message, Colors.blue, Icons.info);
  }

}
