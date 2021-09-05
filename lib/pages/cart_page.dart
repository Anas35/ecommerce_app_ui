import 'package:ecommerce_app_ui/src/product.dart';
import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/widgets/circular_button.dart';
import 'package:ecommerce_app_ui/widgets/horizontal_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cart extends StatelessWidget {

  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Product> cartList = DataWidget.of(context).cartList;

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFc471ed),
              Color(0xFFf64f59),
            ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: const Text('Cart',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cartList.isNotEmpty ? HorizontalProduct(cartList) : const Center(
                  child: Text('Cart is Empty',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                cartList.isNotEmpty ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text('₹' + totalCost(cartList),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )  : const SizedBox.shrink(),
                const SizedBox(height: 20),
                cartList.isNotEmpty ? Align(
                  alignment: Alignment.centerRight,
                  child: CircularButton(
                    text: 'Buy',
                    onPressed: () {},
                  ),
                ) : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String totalCost(List<Product> cartList) {
    double maxCost = 0;

    cartList.map((Product product) {
      maxCost += product.cost;
    }).toList();

    return maxCost.toString();
  }
}