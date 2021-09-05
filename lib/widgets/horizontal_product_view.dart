import 'package:ecommerce_app_ui/src/product.dart';
import 'package:flutter/material.dart';

class HorizontalProduct extends StatelessWidget {

  final List<Product> cartList;

  const HorizontalProduct(this.cartList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: cartList.map((Product product) => Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              border: Border.all(),
              borderRadius: BorderRadius.circular(16.0)
            ),
            padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.fromSize(
                    size: const Size(75, 75),
                    child: Card(
                      child: Image.asset(product.photo),
                    ),
                  ),
                  Text(product.quantity.toString() + ' x',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size(100, 50),
                    child: Center(
                      child: Text(product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Text('₹' + product.cost.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
        ),
        ).toList(),
      ),
    );
  }
}