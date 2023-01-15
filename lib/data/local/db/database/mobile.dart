import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:get/get.dart';
import 'package:insurance/data/local/db/app_database.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;

AppDatabase constructDb({bool logStatements = true, String? path}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      // final deviceId = await getDeviceId();
      // return EncryptedExecutor.inDatabaseFolder(
      //   path: dbFile.path,
      //   password: deviceId,
      //   logStatements: logStatements,
      //   singleInstance: true,
      // );
      return NativeDatabase(dbFile, logStatements: logStatements);
    });
    return AppDatabase(executor);
  }
  if (Platform.isMacOS || Platform.isLinux) {
    final file = File('db.sqlite');
    Get.printInfo(info: "Db location ${file.absolute}");
    return AppDatabase(
      NativeDatabase(
        file,
        logStatements: logStatements,
      ),
    );
  }
  if (Platform.isWindows) {
    final file = File('db.sqlite');
    return AppDatabase(NativeDatabase(file, logStatements: logStatements));
  }
  return AppDatabase(NativeDatabase.memory(logStatements: logStatements));
}
