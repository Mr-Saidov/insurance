import 'package:insurance/data/local/db/app_database.dart';

class InsuranceWithClientAndEmployee {
  final InsuranceTableData insuranceTableData;
  final ClientTableData? clientTableData;
  final EmployeeTableData? employeeTableData;

  InsuranceWithClientAndEmployee({
    required this.insuranceTableData,
    this.clientTableData,
    this.employeeTableData,
  });
}
