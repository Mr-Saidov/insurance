import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';

class ClientsController extends GetxController{
  final AppDatabase _appDatabase = Get.find();
  late BranchTableData branchTableData;

  streamAllClients(int id) => _appDatabase.streamAllClients(id);

  void deleteEmployee(int id) {
    _appDatabase.deleteEmployee(id);
  }
}