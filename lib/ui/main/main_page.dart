import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';
import 'package:insurance/ui/edit_branch/edit_branch_binding.dart';
import 'package:insurance/ui/edit_branch/edit_branch_page.dart';
import 'package:insurance/ui/main/main_controller.dart';
import 'package:insurance/ui/show_branch/show_branch_binding.dart';
import 'package:insurance/ui/show_branch/show_branch_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halol sug'urta"),
      ),
      body: StreamBuilder(
        stream: controller.streamAllBranches(),
        builder: (context, AsyncSnapshot<List<BranchTableData>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Filiallar mavjud emas"),
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
                      "${item.name}",
                    ),
                    subtitle: Text("Manzili: ${item.address}"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "${item.name}",
                            textAlign: TextAlign.center,
                          ),
                          actions: [
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
                                title: const Text("Ko'rish"),
                                onTap: () {
                                  Get.back();
                                  Get.to(
                                    ShowBranchPage(branchTableData: item),
                                    binding: ShowBranchBinding(),
                                  );
                                },
                              ),
                              ListTile(
                                title: const Text("Tahrirlash"),
                                onTap: () {
                                  Get.back();
                                  Get.to(
                                    EditBranchPage(branchTableData: item),
                                    binding: EditBranchBinding(),
                                  );
                                },
                              ),
                              ListTile(
                                title: const Text("O'chirish"),
                                onTap: () {
                                  Get.back();
                                  showDeleteClientDialog(item, context);
                                },
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
          Get.to(EditBranchPage(), binding: EditBranchBinding());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showDeleteClientDialog(BranchTableData item, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "${item.name}",
        ),
        content: const Text(
            "\t\tFilial ma'lumotlarini rostdan ham o'chirmoqchimisiz?\n\t\tBunda filialga tegishli xodimlar, mijozlar, sug'urta shartnomalari ma'lumotlari ham o'chib ketadi."),
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
                controller.deleteBranch(item.id!);
                // controller.deleteProductByClientId(item.id!);
              },
              child: const Text("O'chirish"),
            ),
        ],
      ),
    );
  }
}
