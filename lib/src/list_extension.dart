import 'package:ecommerce_app_ui/src/product.dart';

extension ListContains on List {

  bool isContain(Product product) {
    for (Product prt in this) {
      if (prt.id == product.id) {
        return true;
      }
    }
    return false;
  }

}