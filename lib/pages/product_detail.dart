import 'package:ecommerce_app_ui/src/product.dart';
import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/widgets/add_sheet.dart';
import 'package:ecommerce_app_ui/widgets/circular_button.dart';
import 'package:ecommerce_app_ui/widgets/quantity_box.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {

  final Product product;
  final bool isInCart;

  const ProductDetail({
    Key? key,
    required this.product,
    required this.isInCart
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.product.quantity;
  }

  double totalCost(int id, List<Product> productList) => productList.firstWhere((Product element) => element.id == id).cost * quantity;

  @override
  Widget build(BuildContext context) {

    DataWidgetState state = DataWidget.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Color(0xFF7b4b93)),
              onPressed: (){},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(widget.product.photo),
                ),
                const SizedBox(height: 15),
                Text(widget.product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.product.gram.toString() + 'g',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('₹'+ totalCost(widget.product.id, state.productList).toString(),
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    QuantityBox(
                      quantity: quantity,
                      onIncrement: () => setState(() => quantity++),
                      onDecrement: () {
                        if(quantity > 1) setState(() => quantity--);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Text('About this Product',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(widget.product.description,
                  style: TextStyle(height: 1.5, color: Colors.grey.shade800, fontSize: 18)
                ),
              ],
            ),
          ),
        ),
        bottomSheet: AddSheet(
          circularButton: widget.isInCart ? CircularButton(
            text: 'Remove from Cart',
            onPressed: () {
              state.removeFromCart(widget.product);
              Navigator.pop(context);
            },
          ) : CircularButton(
            text: 'Add to Cart',
            onPressed: (){
              final Product updatedProduct = widget.product.copyWith(
                cost: totalCost(widget.product.id, state.productList),
                quantity: quantity
              );
              state.addToCart(updatedProduct);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}