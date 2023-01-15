import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:insurance/app/app_pages.dart';
import 'package:insurance/app/app_routes.dart';
import 'package:insurance/app/desktop/desktop.dart';
import 'package:insurance/data/local/db/database/mobile.dart';
import 'package:insurance/ui/main/main_binding.dart';

void main() async {
  setTargetPlatformForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(constructDb());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set portrait orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    final theme = ThemeData(
      primaryColor: Colors.green,
      appBarTheme: const AppBarTheme(color: Colors.green),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green)
    );
    return GetMaterialApp(
      initialRoute: Routes.MAIN,
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      getPages: AppPages.routes,
      // translations: Messages(),
      enableLog: true,
      defaultTransition: Transition.cupertino,
      popGesture: true,
      theme: theme,
      darkTheme: theme,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
    );
  }
}
