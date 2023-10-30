import 'package:designs_pattern/src/adapter/examples/class_adapter/Supplier.dart';
import 'package:designs_pattern/src/adapter/examples/class_adapter/Vendor.dart';

class VendorClassAdapter extends Vendor implements Supplier{
  @override
  String? getBusinessAddress() {
    return getCompanyAddress();
  }

  @override
  String? getBusinessName() {
    return getCompanyName();
  }

  @override
  String? getFullName() {
    return getName();
  }

}