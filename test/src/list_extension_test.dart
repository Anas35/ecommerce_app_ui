import 'package:ecommerce_app_ui/src/list_extension.dart';
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  List<Product> _dummyProductList = [
    Product(id: 1, photo: 'photo', cost: 10, name: 'product-1', gram: 10, quantity: 1, description: 'description'),
    Product(id: 2, photo: 'photo', cost: 250, name: 'product-2', gram: 500, quantity: 3, description: 'description'),
    Product(id: 3, photo: 'photo', cost: 75, name: 'product-3', gram: 100, quantity: 1, description: 'description'),
    Product(id: 4, photo: 'photo', cost: 85, name: 'product-4', gram: 70, quantity: 2, description: 'description'),
    Product(id: 5, photo: 'photo', cost: 125, name: 'product-5', gram: 195, quantity: 1, description: 'description'),
  ];

  Product product1 = Product(id: 3, photo: 'photo', cost: 75, name: 'product-3', gram: 100, quantity: 1, description: 'description');
  Product product2 = Product(id: 3, photo: 'photo', cost: 150, name: 'product-3', gram: 100, quantity: 2, description: 'description');
  Product product3 = Product(id: 6, photo: 'photo', cost: 15, name: 'product-5', gram: 15, quantity: 2, description: 'description');

  test('isContain extension on List', () {

    /// Expect true when one of the id is equal
    expect(_dummyProductList.isContain(product1), true);
    /// Expect true when one of the id is equal, irrespective of other properties
    expect(_dummyProductList.isContain(product2), true);
    /// Expect false when no id matches 
    expect(_dummyProductList.isContain(product3), false);

  });
  
}