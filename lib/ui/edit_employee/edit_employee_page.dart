import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';
import 'package:insurance/ui/edit_employee/edit_employee_controller.dart';

class EditEmployeePage extends GetView<EditEmployeeController> {
  EditEmployeePage(
      {Key? key, required this.branchTableData, this.employeeTableData})
      : super(key: key);
  BranchTableData branchTableData;
  EmployeeTableData? employeeTableData;

  @override
  Widget build(BuildContext context) {
    controller.branchTableData = branchTableData;
    if (employeeTableData != null) {
      controller.employeeTableData = employeeTableData;
      controller.refreshControllers();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(employeeTableData != null
            ? "Xodimni tahrirlash"
            : "Yangi xodim qo'shish"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          TextField(
            controller: controller.fullNaneController,
            onChanged: (a) => controller.checkReady(),
            textInputAction: TextInputAction.next,
            maxLines: 1,
            autofocus: true,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              labelText: "Xodimning nomi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          TextField(
            controller: controller.pinflController,
            onChanged: (a) => controller.checkReady(),
            maxLines: 1,
            inputFormatters: [LengthLimitingTextInputFormatter(9)],
            decoration: InputDecoration(
              labelText: "Passport ma'lumotlari (JSHSHIR)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          TextField(
            controller: controller.phoneController,
            onChanged: (a) => controller.checkReady(),
            maxLines: 1,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Telefon raqami",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
        ],
      ),
      floatingActionButton: Obx(
        () {
          return controller.isReadyToSave.value
              ? FloatingActionButton(
                  onPressed: () async {
                    final r = await controller.saveEmployee();
                    print("object r $r");
                    Get.back();
                  },
                  child: const Icon(Icons.done),
                )
              : Container();
        },
      ),
    );
  }

  getDivider() => const SizedBox(height: 8);
}
