import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';

class EditEmployeeController extends GetxController {
  TextEditingController fullNaneController = TextEditingController();
  TextEditingController pinflController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var isReadyToSave = false.obs;
  AppDatabase appDatabase = Get.find();
  late BranchTableData branchTableData;
  EmployeeTableData? employeeTableData;

  checkReady() {
    isReadyToSave.value = !(fullNaneController.text.trim().toString().isEmpty ||
        pinflController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty);
  }

  void refreshControllers() {
    fullNaneController.text = employeeTableData!.fullName!;
    pinflController.text = employeeTableData!.pinfl!;
    phoneController.text = employeeTableData!.phone!;
    checkReady();
  }

  saveEmployee() async => appDatabase.insertEmployee(
        EmployeeTableData(
            id: employeeTableData?.id,
            pinfl: pinflController.text.trim(),
            fullName: fullNaneController.text.trim(),
            phone: phoneController.text.trim(),
            branchId: branchTableData.id),
      );
}
