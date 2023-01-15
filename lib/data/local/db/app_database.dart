import 'package:drift/drift.dart';
import 'package:insurance/data/local/db/joins/insurance_with_client_and_employee.dart';
import 'package:insurance/data/local/db/tables/branch.dart';
import 'package:insurance/data/local/db/tables/client.dart';
import 'package:insurance/data/local/db/tables/employee.dart';
import 'package:insurance/data/local/db/tables/insurance_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    BranchTable,
    EmployeeTable,
    ClientTable,
    InsuranceTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor executor) : super(
            // EncryptedExecutor.inDatabaseFolder(
            //   path: "app.db",
            //   logStatements: true,
            //   singleInstance: true,
            //   password: "goCoder_Pass",
            // ),
            executor);

  @override
  int get schemaVersion => 1;

  void insertBranch(BranchTableData branchTableData) => into(branchTable)
      .insert(branchTableData, mode: InsertMode.insertOrReplace);

  insertEmployee(EmployeeTableData employeeTableData) async =>
      into(employeeTable)
          .insert(employeeTableData, mode: InsertMode.insertOrReplace);

  insertClient(ClientTableData clientTableData) async => into(clientTable)
      .insert(clientTableData, mode: InsertMode.insertOrReplace);

  insertInsurance(InsuranceTableData insuranceTableData) async =>
      into(insuranceTable)
          .insert(insuranceTableData, mode: InsertMode.insertOrReplace);

//
// void insertProduct(ProductTableData productTableData) => into(productTable)
//     .insert(productTableData, mode: InsertMode.insertOrReplace);
//
  Stream<List<BranchTableData>> streamAllBranches() => (select(branchTable)
        ..orderBy(
            [(u) => OrderingTerm(expression: u.name, mode: OrderingMode.asc)]))
      .watch();

  Stream<List<InsuranceTableData>> streamAllInsurance() =>
      (select(insuranceTable)
            ..orderBy([
              (u) => OrderingTerm(expression: u.name, mode: OrderingMode.asc)
            ]))
          .watch();

  Stream<List<InsuranceWithClientAndEmployee>> streamAllInsuranceWithClientAndEmployee(
      int branchId) {
    final query = (select(insuranceTable)
          ..where((tbl) => tbl.branchId.equals(branchId))
          ..orderBy([
            (u) => OrderingTerm(expression: u.name, mode: OrderingMode.asc)
          ]))
        .join([
      leftOuterJoin(
          clientTable, insuranceTable.clientId.equalsExp(clientTable.id)),
      leftOuterJoin(
          employeeTable, insuranceTable.employeeId.equalsExp(employeeTable.id)),
    ]);
    return query.watch().map((rows) {
      return rows.map((row) {
        return InsuranceWithClientAndEmployee(
          insuranceTableData: row.readTable(insuranceTable),
          clientTableData: row.readTable(clientTable),
          employeeTableData: row.readTable(employeeTable),
        );
      }).toList();
    });
  }

  Stream<List<EmployeeTableData>> streamAllEmployees(int id) =>
      (select(employeeTable)
            ..where((tbl) => tbl.branchId.equals(id))
            ..orderBy([
              (u) =>
                  OrderingTerm(expression: u.fullName, mode: OrderingMode.asc)
            ]))
          .watch();

  Stream<List<ClientTableData>> streamAllClients(int id) => (select(clientTable)
        ..where((tbl) => tbl.branchId.equals(id))
        ..orderBy([
          (u) => OrderingTerm(expression: u.fullName, mode: OrderingMode.asc)
        ]))
      .watch();

// Stream<List<ProductTableData>> streamAllProductsByClientId(int clientId) {
//   return (select(productTable)
//         ..where((t) => t.clientId.equals(clientId))
//         ..orderBy([
//           (u) => OrderingTerm(expression: u.name, mode: OrderingMode.asc)
//         ]))
//       .watch();
// }
//
  void deleteBranch(int id) {
    (delete(branchTable)..where((tbl) => branchTable.id.equals(id))).go();
  }

  void deleteInsurance(int id) {
    (delete(insuranceTable)..where((tbl) => insuranceTable.id.equals(id))).go();
  }

  void deleteEmployee(int id) {
    (delete(employeeTable)..where((tbl) => employeeTable.id.equals(id))).go();
  }

  void deleteClient(int id) {
    (delete(clientTable)..where((tbl) => clientTable.id.equals(id))).go();
  }
//
// void deleteProduct(int id) {
//   (delete(productTable)..where((tbl) => productTable.id.equals(id))).go();
// }
//
// void deleteProductByClientId(int id) {
//   (delete(productTable)..where((tbl) => productTable.clientId.equals(id)))
//       .go();
// }
}
