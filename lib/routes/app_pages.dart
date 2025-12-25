import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/loader/loader_page.dart';
import 'package:ppob_koperasi_payment/feature/login/login_binding.dart';
import 'package:ppob_koperasi_payment/feature/login/login_page.dart';

part 'app_routes.dart';

class PageRoutes {
  static final routes = [
    GetPage(name: Routes.initial, page: () => const LoaderPage()),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
