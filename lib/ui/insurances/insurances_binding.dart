import 'package:get/get.dart';
import 'package:insurance/ui/insurances/insurances_controller.dart';

class InsurancesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InsurancesController());
  }
}
