import 'package:drift/drift.dart';

class ClientTable extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get fullName => text().nullable()();

  TextColumn get phone => text().nullable()();

  TextColumn get pinfl => text().nullable()();

  IntColumn get branchId => integer().nullable()();
}
