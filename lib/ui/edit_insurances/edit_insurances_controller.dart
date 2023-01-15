import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';

class EditInsurancesController extends GetxController {
  TextEditingController objectController = TextEditingController();
  TextEditingController sumInsuranceController = TextEditingController();
  TextEditingController insuranceMoneyController = TextEditingController();
  var clientTableData = const ClientTableData().obs;
  var employeeTableData = const EmployeeTableData().obs;
  var startDate = DateTime.fromMillisecondsSinceEpoch(0).obs;
  var endDate = DateTime.fromMillisecondsSinceEpoch(0).obs;
  late BranchTableData branchTableData;
  List<ClientTableData> clientsList = [];
  List<EmployeeTableData> employeesList = [];
  AppDatabase appDatabase = Get.find();
  var percent = 10.0.obs;
  var isReadyToSave = false.obs;
  InsuranceTableData? insuranceTableData;

  checkReady() {
    isReadyToSave.value = objectController.text.trim().isNotEmpty &&
        sumInsuranceController.text.trim().isNotEmpty &&
        insuranceMoneyController.text.trim().isNotEmpty &&
        employeeTableData.value.id != 0 &&
        clientTableData.value.id != 0 &&
        startDate.value.millisecondsSinceEpoch != 0 &&
        endDate.value.millisecondsSinceEpoch != 0;
    percent.refresh();
  }

  getFromDb() {
    appDatabase.streamAllEmployees(branchTableData.id!).listen((event) {
      employeesList = event;
    });
    appDatabase.streamAllClients(branchTableData.id!).listen((event) {
      clientsList = event;
    });
  }

  void initData() {
    objectController.text = insuranceTableData?.name ?? "";
    sumInsuranceController.text = insuranceTableData?.sumInsurance ?? "";
    insuranceMoneyController.text = insuranceTableData?.insuranceMoney ?? "";
    startDate.value =
        insuranceTableData?.startDate ?? DateTime.fromMillisecondsSinceEpoch(0);
    endDate.value =
        insuranceTableData?.endDate ?? DateTime.fromMillisecondsSinceEpoch(0);
    percent.value = (insuranceTableData?.percent ?? 10) * 1.0;
  }

  saveInsurance() {
    appDatabase.insertInsurance(
      InsuranceTableData(
        name: objectController.text.trim(),
        branchId: branchTableData.id,
        startDate: startDate.value,
        endDate: endDate.value,
        clientId: clientTableData.value.id,
        employeeId: employeeTableData.value.id,
        sumInsurance: sumInsuranceController.text.replaceAll(" ", "").trim(),
        insuranceMoney:
            insuranceMoneyController.text.replaceAll(" ", "").trim(),
        percent: percent.value.toInt(),
        id: insuranceTableData?.id,
      ),
    );
  }
}
