import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';

class MainController extends GetxController {
  final AppDatabase _appDatabase = Get.find();

  streamAllBranches() => _appDatabase.streamAllBranches();


  void deleteBranch(int id) {
    _appDatabase.deleteBranch(id);
  }
  //
  // void deleteProductByClientId(int i) {
  //   _appDatabase.deleteProductByClientId(i);
  // }
}
