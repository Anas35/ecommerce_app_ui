import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:ecommerce_app_ui/widgets/cart_sheet.dart';
import 'package:ecommerce_app_ui/widgets/product_cart.dart';
import 'package:ecommerce_app_ui/pages/product_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataWidgetState state = DataWidget.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFe3e3e3),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Dairy Milk',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Color(0xFF7b4b93)),
              onPressed: () {},
            ),
          ],
        ),
        body: GridView.builder(
          padding: const EdgeInsets.only(bottom: 80),
          itemCount: state.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Product product = state.productList[index];
                bool isInCart = false;

                for(Product prod in state.cartList) {
                  if (prod.id == product.id) {
                    product = prod;
                    isInCart = true;
                    break;
                  }
                }

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ProductDetail(
                    key: const Key('ProductDetail'),
                    product: product,
                    isInCart: isInCart
                  )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    index.isOdd
                        ? const SizedBox(height: 25)
                        : const SizedBox.shrink(),
                    Expanded(child: ProductCard(product: state.productList[index])),
                    index.isEven
                        ? const SizedBox(height: 25)
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            );
          },
        ),
        bottomSheet: const CartSheet()
      ),
    );
  }
}
