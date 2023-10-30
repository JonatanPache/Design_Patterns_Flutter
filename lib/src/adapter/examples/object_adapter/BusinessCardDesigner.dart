import 'package:designs_pattern/src/adapter/examples/object_adapter/Customer.dart';

class BusinessCardDesigner{
  String designCard(Customer customer){
    String card = "";
    card = "${customer.getName()}, ${customer.getDesignation()}, ${customer.getAddress()}";
    return card;
  }
}