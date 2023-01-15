import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';
import 'package:insurance/ui/clients/clients_binding.dart';
import 'package:insurance/ui/clients/clients_page.dart';
import 'package:insurance/ui/employee/employee_binding.dart';
import 'package:insurance/ui/employee/employee_page.dart';
import 'package:insurance/ui/insurances/insurances_binding.dart';
import 'package:insurance/ui/insurances/insurances_page.dart';
import 'package:insurance/ui/show_branch/show_branch_controller.dart';

class ShowBranchPage extends GetView<ShowBranchController> {
  ShowBranchPage({Key? key, required this.branchTableData}) : super(key: key);
  BranchTableData branchTableData;

  @override
  Widget build(BuildContext context) {
    controller.branchTableData = branchTableData;
    controller.refreshData();
    return Scaffold(
      appBar: AppBar(
        title: Text("${branchTableData.name}"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Manzili: ${branchTableData.address}"),
          ),
          ListTile(
            title: Text("Telefon raqami: ${branchTableData.phone}"),
          ),
          ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              const Divider(),
              ListTile(
                title: const Text(
                  "Xodimlar",
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Obx(
                    () => Text("${controller.employeesCount} ta xodim mavjud")),
                onTap: () {
                  Get.to(
                    EmployeePage(branchTableData: branchTableData),
                    binding: EmployeeBinding(),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  "Mijozlar",
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Obx(
                    () => Text("${controller.clientsCount} ta mijoz mavjud")),
                onTap: () {
                  Get.to(
                    ClientsPage(branchTableData: branchTableData),
                    binding: ClientsBinding(),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  "Sug'urta shartnomalar",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  if (controller.clientsCount.value > 0 &&
                      controller.employeesCount.value > 0) {
                    Get.to(
                      InsurancesPage(branchTableData: branchTableData),
                      binding: InsurancesBinding(),
                    );
                  } else {
                    String message = "";
                    if (controller.clientsCount.value == 0 &&
                        controller.employeesCount.value == 0) {
                      message = "Avval xodim va mijozlar qo'shishingiz kerak";
                    } else if (controller.clientsCount.value == 0) {
                      message = "Avval mijozlar qo'shishingiz kerak";
                    } else {
                      message = "Avval xodimlar qo'shishingiz kerak";
                    }
                    if (message.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(message),
                          actions: [
                            OutlinedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("Ok"))
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
