import 'package:get/get.dart';
import 'package:insurance/ui/edit_insurances/edit_insurances_controller.dart';

class EditInsurancesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditInsurancesController());
  }
}
