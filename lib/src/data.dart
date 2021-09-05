import 'package:ecommerce_app_ui/src/list_extension.dart';
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataScope extends InheritedWidget {

  final DataWidgetState state;
  final List<Product> cartList;
  final List<Product> productList;
  final Widget widget;

  const DataScope({
    Key? key,
    required this.state,
    required this.productList,
    required this.cartList,
    required this.widget
    }) : super(key: key, child: widget);

  @override
  bool updateShouldNotify(DataScope oldWidget) => listEquals(cartList, oldWidget.cartList);

}

class DataWidget extends StatefulWidget {

  final Widget child;

  const DataWidget({Key? key, required this.child}) : super(key: key);

  static DataWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataScope>()!.state;
  }

  @override
  DataWidgetState createState() => DataWidgetState();
}

class DataWidgetState extends State<DataWidget> {

  List<Product> get productList => _products;

  List<Product> cartList = [];

  void addToCart(Product product) {
    if (!cartList.isContain(product)) setState(() => cartList.add(product));
  }

  void removeFromCart(Product product) {
    if (cartList.isContain(product)) setState(() => cartList.remove(product));
  }

  @override
  Widget build(BuildContext context) {
    return DataScope(
      state: this,
      productList: productList,
      cartList: cartList,
      widget: widget.child,
    );
  }
}

final List<Product> _products = [
  Product(
    id: 1,
    photo: 'images/oreo.jpg',
    cost: 175,
    name: 'Oreo Chocolate Bar',
    gram: 130,
    quantity: 1,
    description: 'Cadbury dairy milk silk now comes in new exciting oreo flavour. Your favourite cadbury dairy milk now in a softer, smoother and creamier taste. Made from the delicious silky chocolate flavour and the crunchy oreo cookies, this chocolate is a treat for everyone'
  ),
  Product(
    id: 2,
    photo: 'images/silk.jpg',
    cost: 160,
    name: 'Silk Chocolate Bar',
    gram: 100,
    quantity: 1,
    description: 'Cadbury dairy milk silk is all about regaling in the chocolate\'s richness and creaminess. The classic taste of cadbury chocolates offers you the reason to celebrate every small and big occasion of happiness. In short, indulge in the premium chocolate delicacy.'
  ),
  Product(
    id: 3,
    photo: 'images/mousse.jpg',
    cost: 80,
    name: 'Mousse Chocolate Bar',
    gram: 50,
    quantity: 1,
    description: 'Cadbury dairy milk silk mousse has the same smooth and classic taste of Cadbury silk chocolates with the added twist of mousse which makes it fluffy, creamy, and thick. The mousse bubbles simply make it a little bigger to bite into, a little airier when you are chewing with soft creamy chocolate inside.'
  ),
  Product(
    id: 4,
    photo: 'images/bubbly.jpg',
    cost: 175,
    name: 'Bubbly Chocolate Bar',
    gram: 120,
    quantity: 1,
    description: 'Cadbury dairy milk silk bubbly has the same smooth flavour that you would expect from cadbury\'s silk with the added twist of bubbles (completely non-flavour altering). It is a milk chocolate, so it is on the sweeter, milkier side.'
  ),
  Product(
    id: 5,
    photo: 'images/fruit_and_nut.jpg',
    cost: 80,
    name: 'Fruit & Nut Chocolate Bar',
    gram: 55,
    quantity: 1,
    description: 'The classic taste of Cadbury chocolates enriched with the real goodness of nuts and raisins offers you the reason to celebrate every small and big occasion of happiness.'
  ),
  Product(
    id: 6,
    photo: 'images/hazelnut.jpg',
    cost: 80,
    name: 'Hazelnut Chocolate Bar',
    gram: 58,
    quantity: 1,
    description: 'Cadbury Dairy Milk Hazelnut is milk chocolate that is made with the best quality of milk chocolate and hazelnuts. It is a perfect mix of rich milk with creamy and silk chocolate.'
  )
];