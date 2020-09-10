import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_ui/const.dart';
import 'package:shopping_ui/data/productList.dart';
import 'package:shopping_ui/ui/homePage.dart';
import 'dart:collection';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    cartList = LinkedHashSet<int>.from(cartList).toList();

    return SafeArea(
      child: Scaffold(
          backgroundColor: kPurple,
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(children: [
                  Icon(Icons.arrow_upward, size: 25, color: Colors.white),
                  SizedBox(width: 40),
                  Text('Cart',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ]),
                SizedBox(
                  height: 20,
                ),
                cartList.length != 0
                    ? Expanded(
                        child: ListView(
                            children: cartList
                                .map((i) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 75,
                                              width: 75,
                                              child: Card(
                                                child: Image.asset(
                                                    product[i].photo),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                                product[i].quantity.toString() +
                                                    ' x',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                                height: 50,
                                                width: 100,
                                                child: Center(
                                                  child: Text(product[i].name,
                                                      style: kBoldWhiteText),
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                '\uFF04' +
                                                    (product[i].cost *
                                                            product[i].quantity)
                                                        .floor()
                                                        .toString(),
                                                style: kBoldWhiteText),
                                          ]),
                                    ))
                                .toList()),
                      )
                    : Center(
                        child: Text('Cart is Empty',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                cartList.length != 0
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white60),
                              ),
                              Text(
                                '\uFF04' + totalCost(),
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  width: 120,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: kPurple,
                                      border: Border.all(color: kYellow),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Text(
                                    'Remove Item',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: kYellow, fontSize: 20),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              ButtonTheme(
                                height: 55,
                                minWidth: 220,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        bottomLeft: Radius.circular(16.0),
                                      ),
                                    ),
                                    color: kYellow,
                                    child: Text(
                                      'Add to cart',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                    : Text(''),
              ],
            ),
          )),
    );
  }

  totalCost() {
    int maxCost = 0;

    cartList.map((i) {
      int cost = (product[i].cost * product[i].quantity).floor();
      maxCost = maxCost + cost;
    }).toList();

    return maxCost.toString();
  }
}
