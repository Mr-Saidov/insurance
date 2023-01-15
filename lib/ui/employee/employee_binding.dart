import 'package:get/get.dart';
import 'package:insurance/ui/employee/employee_controller.dart';

class EmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeController());
  }
}
