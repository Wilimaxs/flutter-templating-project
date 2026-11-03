import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter/data/remote/api_service.dart';
import 'package:template_flutter/data/remote/dio_initializer.dart';
import 'package:template_flutter/routes/app_pages.dart';
import 'package:template_flutter/utils/localization/app_translation.dart';
import 'package:template_flutter/utils/theme/app_theme.dart';

import 'data/local_storage/storage_manager.dart';
import 'feature/auth/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  Get.put(DioInitializer());
  Get.put(ApiService(Get.find<DioInitializer>()));
  Get.put(AuthenticationService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Template Flutter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: Routes.initial,
      getPages: PageRoutes.routes,
      translations: AppTranslation(),
      locale: AppTranslation.locale,
      fallbackLocale: AppTranslation.fallbackLocale,
    );
  }
}
