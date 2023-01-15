import 'package:drift/drift.dart';

class BranchTable extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get name => text().nullable()();

  TextColumn get address => text().nullable()();

  TextColumn get phone => text().nullable()();
}
