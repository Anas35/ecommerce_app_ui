import 'package:flutter/material.dart';
import 'package:shopping_ui/const.dart';
import 'package:shopping_ui/data/productList.dart';
import 'package:shopping_ui/ui/homePage.dart';
import 'dart:collection';

class Cart extends StatefulWidget {

  Cart(this.index, this.number);

  final int index ;
  final int number ;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  int number = 1;

  @override
  Widget build(BuildContext context) {

    if(widget.number != null ) number =  widget.number;

    cartList = LinkedHashSet<int>.from(cartList).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPurple,
        body: Padding(
            padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Row(children: [
                  Icon(Icons.arrow_upward,
                      size: 25,
                      color: Colors.white),
                  SizedBox(width:40),
                  Text('Cart', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))
                ]),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            cartList.length != 0  ?
            Expanded(
              child: ListView(
                children: List.generate(cartList.length, (index) =>
                    Row(
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            child : Card(child: Image.asset(product[index].photo),),),
                          SizedBox(width: 15,),
                          Text(number.toString() + 'x', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(width: 15,),
                          Container(
                             height: 50,
                               width: 120,
                              child: Center(child: Text(product[index].name,style: kBoldWhiteText),)),
                          Text( '\uFF04'+ (product[index].cost * number).toString(), style: kBoldWhiteText)
                        ])
                )
              ),
            )
                :
               Center(
                  child : Text('Cart is Empty', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))
                )
          ],
        ),
        )
      ),
    );
  }
}
