import 'package:designs_pattern/src/adapter/examples/object_adapter/BusinessCardDesigner.dart';
import 'package:designs_pattern/src/adapter/examples/object_adapter/Employee.dart';
import 'package:designs_pattern/src/adapter/examples/object_adapter/EmployeeClassAdapter.dart';

void main(){
  final employee = Employee();
  populateVendorData(employee);
  final adapter = EmployeeClassAdapter(employee: employee);
  final designer = BusinessCardDesigner();
  final card = designer.designCard(adapter);
  print(card);
}

populateVendorData(Employee employee){
  employee.setFullName("Juan Medina");
  employee.setJobTitle("Programmer");
  employee.setOfficeLocation("avenue seven");
}