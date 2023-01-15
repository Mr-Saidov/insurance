import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';
import 'package:insurance/ui/edit_branch/edit_branch_controller.dart';

class EditBranchPage extends GetView<EditBranchController> {
  EditBranchPage({Key? key, this.branchTableData}) : super(key: key);
  BranchTableData? branchTableData;

  @override
  Widget build(BuildContext context) {
    if (branchTableData != null) {
      controller.branchTableData = branchTableData;
      controller.refreshControllers();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(branchTableData == null
            ? "Filial qo'shish"
            : "Filialni tahrirlash"),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TextField(
            controller: controller.nameController,
            onChanged: (a) => controller.checkReady(),
            textInputAction: TextInputAction.next,
            maxLines: 1,
            autofocus: true,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              labelText: "Filial nomi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          TextField(
            controller: controller.addressController,
            onChanged: (a) => controller.checkReady(),
            textInputAction: TextInputAction.next,
            maxLines: 1,
            autofocus: true,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              labelText: "Filial manzili",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          TextField(
            controller: controller.phoneController,
            onChanged: (a) => controller.checkReady(),
            textInputAction: TextInputAction.next,
            maxLines: 1,
            autofocus: true,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              labelText: "Filial telefon raqami",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Obx(
        () {
          return controller.isReadyToSave.value
              ? FloatingActionButton(
                  onPressed: () async {
                    await controller.saveBranch();
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
