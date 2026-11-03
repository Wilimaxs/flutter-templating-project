import 'package:get/get.dart';
import 'package:template_flutter/feature/home/home_controller.dart';

import 'bottom_navigation_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => HomeController());
  }
}
