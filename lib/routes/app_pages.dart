import 'package:get/get.dart';
import 'package:template_flutter/feature/bottom_navigation/bottom_navigation_binding.dart';
import 'package:template_flutter/feature/bottom_navigation/bottom_navigation_page.dart';
import 'package:template_flutter/feature/explore/explore_page.dart';
import 'package:template_flutter/feature/loader/loader_page.dart';
import 'package:template_flutter/feature/login/login_binding.dart';
import 'package:template_flutter/feature/login/login_page.dart';

part 'app_routes.dart';

class PageRoutes {
  static final routes = [
    GetPage(name: Routes.initial, page: () => const LoaderPage()),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.bottomNavigation,
      page: () => const BottomNavigationPage(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const ExplorePage(),
      binding: BottomNavigationBinding(),
    ),
  ];
}
