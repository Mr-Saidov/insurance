import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';
import 'package:insurance/data/local/db/joins/insurance_with_client_and_employee.dart';
import 'package:insurance/ui/edit_insurances/edit_insurances_binding.dart';
import 'package:insurance/ui/edit_insurances/edit_insurances_page.dart';
import 'package:insurance/ui/insurances/insurances_controller.dart';
import 'package:insurance/utils/date_time_utils.dart';
import 'package:insurance/utils/utils.dart';

class InsurancesPage extends GetView<InsurancesController> {
  InsurancesPage({Key? key, required this.branchTableData}) : super(key: key);
  BranchTableData branchTableData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sug'urtalar"),
      ),
      body: StreamBuilder(
        stream: controller
            .streamAllInsuranceWithClientAndEmployee(branchTableData.id!),
        builder: (context,
            AsyncSnapshot<List<InsuranceWithClientAndEmployee>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Sug'urta ma'lumotlari mavjud emas"),
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
                      "Sug'urta obyekti: ${item.insuranceTableData.name}",
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mijoz: ${item.clientTableData?.fullName}"),
                        Text("Xodim: ${item.employeeTableData?.fullName}"),
                        Text(
                          "Sug'urta puli: ${item.insuranceTableData.sumInsurance}",
                        ),
                      ],
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "${item.insuranceTableData.name}",
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            OutlinedButton(
                              child: Text("Tahrirlash"),
                              onPressed: () {
                                Get.back();
                                Get.to(
                                  EditInsurancesPage(
                                    branchTableData: branchTableData,
                                    insuranceTableData: item.insuranceTableData,
                                    employeeTableData: item.employeeTableData,
                                    clientTableData: item.clientTableData,
                                  ),
                                  binding: EditInsurancesBinding(),
                                );
                              },
                            ),
                            OutlinedButton(
                              child: Text("Ok"),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                          contentPadding: EdgeInsets.zero,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: Text(
                                    "Sug'urtani rasmiylashtirgan xodim:\n${item.employeeTableData?.fullName}"),
                              ),
                              ListTile(
                                title: Text(
                                    "Mijoz: ${item.clientTableData?.fullName}"),
                              ),
                              ListTile(
                                title: Text(
                                    "Sug'urta tuzilgan sana: ${item.insuranceTableData.startDate != null ? dateFormatter(item.insuranceTableData.startDate!) : "No'malum"}"),
                              ),
                              ListTile(
                                title: Text(
                                    "Sug'urta tugash sanasi: ${item.insuranceTableData.endDate != null ? dateFormatter(item.insuranceTableData.endDate!) : "No'malum"}"),
                              ),
                              ListTile(
                                title: Text(
                                    "Sug'urtaga qo'yilgan pul:\n${currencyFormatter(double.parse(item.insuranceTableData.sumInsurance?.replaceAll(" ", "") ?? "0"))}"),
                              ),
                              ListTile(
                                title: Text(
                                    "Sug'urta puli:\n${currencyFormatter(double.parse(item.insuranceTableData.insuranceMoney?.replaceAll(" ", "") ?? "0"))}"),
                              ),
                              ListTile(
                                title: Text(
                                    "Xodim ulushi (% da): ${item.insuranceTableData.percent} %"),
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
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(
            EditInsurancesPage(branchTableData: branchTableData),
            binding: EditInsurancesBinding(),
          );
        },
      ),
    );
  }

  void showDeleteInsuranceDialog(
      InsuranceWithClientAndEmployee item, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "${item.insuranceTableData.name}",
        ),
        content: const Text(
            "Sug'urta ma'lumotlarini rostdan ham o'chirmoqchimisiz?"),
        actions: [
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Bekor qilish",
            ),
          ),
          OutlinedButton(
            onPressed: () {
              if (item.insuranceTableData.id != null) {
                controller.deleteInsurance(item.insuranceTableData.id!);
              }
              Get.back();
            },
            child: const Text(
              "O'chirish",
            ),
          ),
        ],
      ),
    );
  }
}
