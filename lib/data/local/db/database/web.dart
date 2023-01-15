import 'package:drift/web.dart';
import 'package:insurance/data/local/db/app_database.dart';

AppDatabase constructDb({bool logStatements = false}) {
  return AppDatabase(WebDatabase('db', logStatements: logStatements));
}
