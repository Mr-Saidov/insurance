import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';

class ShowBranchController extends GetxController {
  late BranchTableData branchTableData;
  final AppDatabase _appDatabase = Get.find();
  var employeesCount = 0.obs;
  var clientsCount = 0.obs;

  void refreshData() {
    _appDatabase.streamAllClients(branchTableData.id!).listen((event) {
      clientsCount.value = event.length;
    });
    _appDatabase.streamAllEmployees(branchTableData.id!).listen((event) {
      employeesCount.value = event.length;
    });
  }
}
