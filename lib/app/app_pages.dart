import 'package:get/get.dart';
import 'package:insurance/app/app_routes.dart';
import 'package:insurance/ui/main/main_controller.dart';
import 'package:insurance/ui/main/main_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => MainPage(),
      binding: BindingsBuilder(() => Get.put(() => MainController())),
    ),
    // GetPage(
    //   name: Routes.COURSE,
    //   page: () => SectionsPage(
    //     course: null,
    //     index: 0,
    //   ),
    //   binding: BindingsBuilder(() => Get.put(() => SectionsController())),
    // ),
  ];
}
