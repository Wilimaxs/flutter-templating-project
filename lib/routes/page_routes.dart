import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/login/login_binding.dart';
import 'package:ppob_koperasi_payment/feature/login/login_page.dart';

part 'page_names.dart';

class PageRoutes {
  static final routes = [
    GetPage(
      name: PageNames.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
