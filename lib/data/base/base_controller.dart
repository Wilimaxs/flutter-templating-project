import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/data/dialogMixin/dialog_mixin.dart';
import 'package:ppob_koperasi_payment/data/local_storage/storage_manager.dart';

abstract class BaseController<T> extends GetxController with DialogMixin {
  final isLoading = false.obs;

  final data = Rxn<T>();

  final storage = StorageManager();

  void setLoading(bool value) => isLoading.value = value;

  void hideKeyboard() {
    final context = Get.context;
    if (context != null) FocusScope.of(context).unfocus();
  }

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
}
