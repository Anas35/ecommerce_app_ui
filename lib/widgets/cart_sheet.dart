import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:ecommerce_app_ui/pages/cart_page.dart';
import 'package:flutter/material.dart';

class CartSheet extends StatelessWidget {
  
  const CartSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Product> cartList = DataWidget.of(context).cartList;

  return GestureDetector(
    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Cart(
      key: Key('Cart')
    ))),
    child: Container(
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFc471ed),
            Color(0xFFf64f59),
          ],
        ),
      ),
      padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              cartList.isEmpty ? const SizedBox.shrink() : 
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cartList.map((Product product) => Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 7.5),
                        child: Image.asset(product.photo),
                      ),
                    ),
                  ).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: const Color(0xFFd8a046),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(cartList.length.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF7b4b93),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }