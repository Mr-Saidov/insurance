import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';

class EditClientController extends GetxController {
  TextEditingController fullNaneController = TextEditingController();
  TextEditingController pinflController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var isReadyToSave = false.obs;
  AppDatabase appDatabase = Get.find();
  late BranchTableData branchTableData;
  ClientTableData? clientTableData;

  checkReady() {
    isReadyToSave.value = !(fullNaneController.text.trim().toString().isEmpty ||
        pinflController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty);
  }

  void refreshControllers() {
    fullNaneController.text = clientTableData!.fullName!;
    pinflController.text = clientTableData!.pinfl!;
    phoneController.text = clientTableData!.phone!;
    checkReady();
  }

  saveEmployee() async => appDatabase.insertClient(
        ClientTableData(
            id: clientTableData?.id,
            pinfl: pinflController.text.trim(),
            fullName: fullNaneController.text.trim(),
            phone: phoneController.text.trim(),
            branchId: branchTableData.id),
      );
}
