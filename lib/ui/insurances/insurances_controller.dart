import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';

class InsurancesController extends GetxController {
  final AppDatabase _appDatabase = Get.find();

  streamAllInsuranceWithClientAndEmployee(int branchId) => _appDatabase.streamAllInsuranceWithClientAndEmployee(branchId);

  void deleteInsurance(int id) {
    _appDatabase.deleteInsurance(id);
  }
}
