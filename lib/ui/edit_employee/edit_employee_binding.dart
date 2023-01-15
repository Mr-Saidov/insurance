import 'package:get/get.dart';
import 'package:insurance/ui/edit_employee/edit_employee_controller.dart';

class EditEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditEmployeeController());
  }
}
