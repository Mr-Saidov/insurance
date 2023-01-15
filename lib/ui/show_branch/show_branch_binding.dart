import 'package:get/get.dart';
import 'package:insurance/ui/show_branch/show_branch_controller.dart';

class ShowBranchBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ShowBranchController());
  }
}