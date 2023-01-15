import 'package:get/get.dart';
import 'package:insurance/ui/edit_branch/edit_branch_controller.dart';

class EditBranchBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EditBranchController());
  }
}