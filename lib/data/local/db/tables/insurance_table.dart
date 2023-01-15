import 'package:drift/drift.dart';

class InsuranceTable extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get name => text().nullable()();

  IntColumn get employeeId => integer().nullable()();

  IntColumn get clientId => integer().nullable()();

  IntColumn get branchId => integer().nullable()();

  TextColumn get sumInsurance => text().nullable()();

  TextColumn get insuranceMoney => text().nullable()();

  DateTimeColumn get startDate => dateTime().nullable()();

  DateTimeColumn get endDate => dateTime().nullable()();

  IntColumn get percent => integer().nullable()();
}
