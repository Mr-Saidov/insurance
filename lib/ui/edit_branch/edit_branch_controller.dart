import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';

class EditBranchController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var isReadyToSave = false.obs;
  AppDatabase appDatabase = Get.find();
  BranchTableData? branchTableData;

  checkReady() {
    isReadyToSave.value = nameController.text.trim().isNotEmpty &&
        addressController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty;
  }

  void refreshControllers() {
    nameController.text = branchTableData!.name!;
    addressController.text = branchTableData!.address!;
    phoneController.text = branchTableData!.phone!;
    checkReady();
  }

  Future saveBranch() async => appDatabase.insertBranch(
        BranchTableData(
          id: branchTableData?.id,
          name: nameController.text.trim(),
          address: addressController.text.trim(),
          phone: phoneController.text.trim(),
        ),
      );
}
