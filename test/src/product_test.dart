
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  Product product = Product(id: 1, photo: 'photo', cost: 100, name: 'name', gram: 10, quantity: 1, description: 'description');

  test('Equality', () {

    final Product temp1 = Product(id: 1, photo: 'photo', cost: 100, name: 'name', gram: 10, quantity: 1, description: 'description');
    expect(product == temp1, true);

    final Product temp2 = Product(id: 1, photo: 'photo', cost: 100, name: 'temp2', gram: 10, quantity: 1, description: 'description');
    expect(product == temp2, false);

  });

  test('copyWith', () {

    expect(product.quantity, 1);
    
    product = product.copyWith(quantity: 5);
    expect(product.quantity, 5);

  });
  
}