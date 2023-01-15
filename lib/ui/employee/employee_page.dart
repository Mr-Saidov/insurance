import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';
import 'package:insurance/ui/edit_employee/edit_employee_binding.dart';
import 'package:insurance/ui/edit_employee/edit_employee_page.dart';
import 'package:insurance/ui/employee/employee_controller.dart';

class EmployeePage extends GetView<EmployeeController> {
  EmployeePage({Key? key, required this.branchTableData}) : super(key: key);
  BranchTableData branchTableData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xodimlar"),
      ),
      body: StreamBuilder(
        stream: controller.streamAllEmployees(branchTableData.id!),
        builder: (context, AsyncSnapshot<List<EmployeeTableData>> snapshot) {
          print("streamAllEmployees ${snapshot.error}");
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Xodimlar mavjud emas"),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return ListTile(
                    title: Text(
                      "${item.fullName}",
                    ),
                    subtitle: Text("Passport ma'lumotlari: ${item.pinfl}"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "${item.fullName}",
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            OutlinedButton(
                              child: const Text("Tahrirlash"),
                              onPressed: () {
                                Get.back();
                                Get.to(
                                  EditEmployeePage(
                                      branchTableData: branchTableData,
                                      employeeTableData: item),
                                  binding: EditEmployeeBinding(),
                                );
                              },
                            ),
                            OutlinedButton(
                              child: const Text("O'chirish"),
                              onPressed: () {
                                Get.back();
                                if (item.id != null) {
                                  showDeleteEmployeeDialog(item, context);
                                }
                              },
                            ),
                            OutlinedButton(
                              child: Text("Ok"),
                              onPressed: () {
                                Get.back();
                              },
                            )
                          ],
                          contentPadding: EdgeInsets.zero,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: Text("Telefon raqami: ${item.phone}"),
                              ),
                              ListTile(
                                title: Text("Passport: ${item.pinfl}"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
              EditEmployeePage(
                branchTableData: branchTableData,
              ),
              binding: EditEmployeeBinding());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showDeleteEmployeeDialog(EmployeeTableData item, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "${item.fullName}",
        ),
        content: const Text(
            "\t\tXodim ma'lumotlarini rostdan ham o'chirmoqchimisiz?\n\t\tBunda xodimga tegishli sug'urta shartnomalari ma'lumotlari ham o'chib ketadi."),
        actions: [
          OutlinedButton(
            onPressed: () => Get.back(),
            child: const Text("Bekor qilish"),
          ),
          if (item.id != null)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                primary: Colors.red,
              ),
              onPressed: () {
                Get.back();
                controller.deleteEmployee(item.id!);
                // controller.deleteProductByClientId(item.id!);
              },
              child: const Text("O'chirish"),
            ),
        ],
      ),
    );
  }
}
