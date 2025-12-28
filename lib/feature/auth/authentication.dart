import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/data/local_storage/storage_manager.dart';
import 'package:ppob_koperasi_payment/model/user.dart';
import 'package:ppob_koperasi_payment/routes/app_pages.dart';

enum AuthStatus { unknown, authenticated, unauthenticated, onboarded }

class AuthenticationService extends GetxService {
  final Rx<AuthStatus> status = AuthStatus.unknown.obs;

  @override
  void onInit() {
    super.onInit();
    status.value = AuthStatus.unknown;
  }

  @override
  void onReady() {
    super.onReady();
    ever(status, _handleRouting);
    checkInitialStatus();
  }

  void checkInitialStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    final String? token = await StorageManager.read<String>(
      'token',
      isSecure: true,
    );
    // final bool isFirstTime =
    //     await StorageManager.read<bool>('isFirstTime') ?? true;

    // if (isFirstTime) {
    //   status.value = AuthStatus.onboarded;
    // } else
    if (token != null && token.isNotEmpty) {
      status.value = AuthStatus.authenticated;
    } else {
      status.value = AuthStatus.unauthenticated;
    }
  }

  void _handleRouting(AuthStatus status) {
    switch (status) {
      case AuthStatus.authenticated:
        Get.offAllNamed(Routes.login);
        break;
      case AuthStatus.unauthenticated:
        Get.offAllNamed(Routes.login);
        break;
      case AuthStatus.onboarded:
        // Get.offAllNamed(Routes.onboarding);
        break;
      default:
        if (Get.currentRoute != Routes.initial) {
          Get.offAllNamed(Routes.initial);
        }
        break;
    }
  }

  Future<void> saveAuthData({required String token, required User user}) async {
    await StorageManager.save('token', token, isSecure: true);
    await StorageManager.save('user', user, isSecure: false);
    // await StorageManager.save('isFirstTime', false);
    setAuthenticated();
  }

  Future<void> logout() async {
    // final bool isFirstTime =
    //     await StorageManager.read<bool>('isFirstTime') ?? false;
    await StorageManager.deleteAll();
    // await StorageManager.save('isFirstTime', isFirstTime);
    setUnauthenticated();
  }

  Future<void> onBoarding() async {
    await StorageManager.save('isFirstTime', false);
    setUnauthenticated();
  }

  void setAuthenticated() {
    status.value = AuthStatus.authenticated;
  }

  void setUnauthenticated() async {
    status.value = AuthStatus.unauthenticated;
  }

  void setOnboarding() async {
    status.value = AuthStatus.unauthenticated;
  }
}
