import 'package:designs_pattern/src/adapter/examples/class_adapter/Supplier.dart';

class PurchaseOrder {
  String createOrder(Supplier supplier){
    String order = "";
    order = "Order Details: ${supplier.getFullName()}, ${supplier.getBusinessName()}, ${supplier.getBusinessAddress()}";
    return order;
  }
}