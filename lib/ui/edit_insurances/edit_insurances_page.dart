import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';
import 'package:insurance/ui/edit_insurances/edit_insurances_controller.dart';
import 'package:insurance/utils/date_time_utils.dart';
import 'package:insurance/utils/utils.dart';
import 'package:money_input_formatter/money_input_formatter.dart';

class EditInsurancesPage extends GetView<EditInsurancesController> {
  EditInsurancesPage({
    Key? key,
    required this.branchTableData,
    this.insuranceTableData,
    this.clientTableData,
    this.employeeTableData,
  }) : super(key: key);
  BranchTableData branchTableData;
  InsuranceTableData? insuranceTableData;
  ClientTableData? clientTableData;
  EmployeeTableData? employeeTableData;

  @override
  Widget build(BuildContext context) {
    controller.branchTableData = branchTableData;
    if (insuranceTableData != null) {
      controller.insuranceTableData = insuranceTableData;
      controller.initData();
    }
    if (employeeTableData != null) {
      controller.employeeTableData.value = employeeTableData!;
    }
    if (clientTableData != null) {
      controller.clientTableData.value = clientTableData!;
    }
    controller.getFromDb();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sug'urta qo'shish"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          TextField(
            controller: controller.objectController,
            onChanged: (a) => controller.checkReady(),
            textInputAction: TextInputAction.next,
            maxLines: 1,
            autofocus: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            decoration: InputDecoration(
              labelText: "Sug'urta obyekti nomi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              final size = MediaQuery.of(context).size.height;
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Wrap(
                    children: [
                      const Center(
                          child: Text(
                        "Xodimni tanlang",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                      SizedBox(
                        height: size / 2,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                "${controller.employeesList[index].fullName}",
                              ),
                              onTap: () {
                                controller.employeeTableData.value =
                                    controller.employeesList[index];
                                controller.checkReady();
                                Get.back();
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: controller.employeesList.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Xodim",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => Text(
                        controller.employeeTableData.value.id != null
                            ? "${controller.employeeTableData.value.fullName}"
                            : "Tanlanmagan")),
                  ),
                ],
              ),
            ),
          ),
          getDivider(),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              final size = MediaQuery.of(context).size.height;
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Wrap(
                    children: [
                      const Center(
                          child: Text(
                        "Mijozni tanlang",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                      SizedBox(
                        height: size / 2,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                "${controller.clientsList[index].fullName}",
                              ),
                              onTap: () {
                                controller.clientTableData.value =
                                    controller.clientsList[index];
                                Get.back();
                                controller.checkReady();
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: controller.clientsList.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mijoz",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => Text(
                        controller.clientTableData.value.id != null
                            ? "${controller.clientTableData.value.fullName}"
                            : "Tanlanmagan")),
                  ),
                ],
              ),
            ),
          ),
          getDivider(),
          TextField(
            controller: controller.sumInsuranceController,
            onChanged: (a) => controller.checkReady(),
            textInputAction: TextInputAction.next,
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [MoneyInputFormatter()],
            decoration: InputDecoration(
              hintText: "Sug'urtaga qo'yilgan pul",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          TextField(
            controller: controller.insuranceMoneyController,
            onChanged: (a) => controller.checkReady(),
            textInputAction: TextInputAction.next,
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [MoneyInputFormatter()],
            decoration: InputDecoration(
              hintText: "Sug'urta puli",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          InkWell(
            onTap: () async {
              final startDate = DateTime.now();
              final endDate = startDate.millisecondsSinceEpoch +
                  60 * 30 * 24 * 60 * 60 * 1000;
              final r = await showDatePicker(
                context: context,
                initialDate: controller.startDate.value ==
                        DateTime.fromMillisecondsSinceEpoch(0)
                    ? DateTime.now()
                    : controller.startDate.value,
                firstDate: DateTime.now(),
                lastDate: DateTime.fromMillisecondsSinceEpoch(endDate),
              );
              if (r == null) {
                controller.startDate.value = DateTime.now();
              } else {
                controller.startDate.value = r;
              }
              controller.checkReady();
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sug'urtalangan vaqt",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() {
                      return Text(
                        controller.startDate.value ==
                                DateTime.fromMillisecondsSinceEpoch(0)
                            ? "Tanlanmagan"
                            : dateFormatter(controller.startDate.value),
                      );
                    }),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
          getDivider(),
          InkWell(
            onTap: () async {
              final startDate = DateTime.now();
              final endDate = startDate.millisecondsSinceEpoch +
                  60 * 30 * 24 * 60 * 60 * 1000;
              final r = await showDatePicker(
                context: context,
                initialDate: controller.endDate.value ==
                        DateTime.fromMillisecondsSinceEpoch(0)
                    ? DateTime.now()
                    : controller.endDate.value,
                firstDate: DateTime.now(),
                lastDate: DateTime.fromMillisecondsSinceEpoch(endDate),
              );
              if (r == null) {
                controller.endDate.value = DateTime.now();
              } else {
                controller.endDate.value = r;
              }
              controller.checkReady();
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sug'urta tugash muddati",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() {
                      return Text(
                        controller.endDate.value ==
                                DateTime.fromMillisecondsSinceEpoch(0)
                            ? "Tanlanmagan"
                            : dateFormatter(controller.endDate.value),
                      );
                    }),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
          getDivider(),
          Center(child: Obx(() {
            return Text(
              "Xodim ulushi (foiz): ${controller.percent.value.toInt()} %",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            );
          })),
          getDivider(),
          Center(
            child: Obx(
              () {
                final percent = controller.percent.value;
                final gaveMoney =
                    controller.sumInsuranceController.text.replaceAll(" ", "");
                if (gaveMoney.isEmpty) return const Text("");
                return Text(
                  "Xodim ulushi (so'mda):\n${currencyFormatter(((percent.toInt()) / 100 * double.parse(gaveMoney)).toPrecision(2))} ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                );
              },
            ),
          ),
          getDivider(),
          Obx(
            () => Slider(
              label: "${controller.percent.value.toInt()} %",
              value: controller.percent.value,
              onChanged: (a) {
                controller.percent.value = a;
              },
              max: 100,
              min: 0,
              divisions: 100,
            ),
          ),
        ],
      ),
      floatingActionButton: Obx(
        () {
          return controller.isReadyToSave.value
              ? FloatingActionButton(
                  onPressed: () async {
                    await controller.saveInsurance();
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
