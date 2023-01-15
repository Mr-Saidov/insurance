import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';

class EmployeeController extends GetxController {
  final AppDatabase _appDatabase = Get.find();
  late BranchTableData branchTableData;

  streamAllEmployees(int id) => _appDatabase.streamAllEmployees(id);

  void deleteEmployee(int id) {
    _appDatabase.deleteEmployee(id);
  }
}
