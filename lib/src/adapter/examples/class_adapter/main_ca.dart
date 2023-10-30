import 'package:designs_pattern/src/adapter/examples/class_adapter/PurchaseOrder.dart';
import 'package:designs_pattern/src/adapter/examples/class_adapter/Vendor.dart';
import 'package:designs_pattern/src/adapter/examples/class_adapter/VendorClassAdapter.dart';

void main(){
  final adapter = VendorClassAdapter();
  populateVendorData(adapter);
  final purchaseOrder = PurchaseOrder();
  final order = purchaseOrder.createOrder(adapter);
  print(order);
}

populateVendorData(Vendor vendor){
  vendor.setName("Juan Medina");
  vendor.setCompanyName("company");
  vendor.setCompanyAddress("avenue seven");
}