import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter/data/dialogMixin/dialog_mixin.dart';
import 'package:template_flutter/data/local_storage/storage_manager.dart';
import 'package:template_flutter/data/remote/api_service.dart';
import 'package:template_flutter/data/remote/errorMapper/network_exception.dart';

abstract class BaseController<T> extends GetxController with DialogMixin {
  final ApiService apiService = Get.find<ApiService>();
  final isLoading = false.obs;
  final isRefreshing = false.obs;
  final CancelToken requestCancelToken = CancelToken();

  final data = Rxn<T>();

  final storage = StorageManager();

  void setLoading(bool value) => isLoading.value = value;

  void hideKeyboard() {
    final context = Get.context;
    if (context != null) FocusScope.of(context).unfocus();
  }

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    await fetchData();
    isRefreshing.value = false;
  }

  Future<void> fetchData() async {}

  Future<void> saveLocal(
    String key,
    dynamic value, {
    bool isSecure = false,
  }) async {
    await StorageManager.save(key, value, isSecure: isSecure);
  }

  Future<E?> readLocal<E>(String key, {bool isSecure = false}) async {
    return await StorageManager.read<E>(key, isSecure: isSecure);
  }

  @override
  void onClose() {
    requestCancelToken.cancel('Controller closed');
    data.value = null;
    super.onClose();
  }

  void showError(String message) => showErrorSnackbar(message);

  void handleNetworkError(NetworkException error) {
    if (error is RequestCancelled) return;
    showError(error.message);
  }
}
