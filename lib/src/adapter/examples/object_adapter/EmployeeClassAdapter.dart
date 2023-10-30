import 'package:designs_pattern/src/adapter/examples/object_adapter/Customer.dart';
import 'package:designs_pattern/src/adapter/examples/object_adapter/Employee.dart';

class EmployeeClassAdapter implements Customer{
  final Employee employee;

  EmployeeClassAdapter({required this.employee});

  @override
  String? getAddress() {
    return employee.getOfficeLocation();
  }

  @override
  String? getDesignation() {
    return employee.getJobTitle();
  }

  @override
  String? getName() {
    return employee.getFullName();
  }

}