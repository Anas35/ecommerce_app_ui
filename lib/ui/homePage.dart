import 'package:flutter/material.dart';
import 'package:shopping_ui/const.dart';
import 'package:shopping_ui/data/productList.dart';
import 'package:shopping_ui/ui/cart.ui.dart';
import 'package:shopping_ui/ui/productDetail.dart';
import 'dart:collection';

List cartList = [];

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    cartList = LinkedHashSet<int>.from(cartList).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: kLightWhite,
        appBar: AppBar(
          backgroundColor: kLightWhite,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Organic Product',
            style: kBoldBlackText,
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: kPurple,
                ),
                onPressed: () {})
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.count(
                childAspectRatio: 0.65,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(
                  6,
                  (index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetail(index))).then((value) {
                              setState(() {
                                if (value != null)
                                cartList.add(value);
                              });
                        }
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 5),
                        child: Column(
                          children: [
                            if(index.isOdd) SizedBox(height: 20,),
                            Card(
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: 15),
                                        AspectRatio(
                                            aspectRatio: 10 / 8,
                                            child:
                                                Image.asset(product[index].photo)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            '\uFF04' +
                                                product[index].cost.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        SizedBox(height: 10),
                                        Text(product[index].name, style: kBoldText),
                                        SizedBox(height: 10),
                                        Text(
                                          product[index].gram.toString() + 'g',
                                          style: TextStyle(color: Colors.grey[400]),
                                        )
                                      ])),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(height: 80,)
          ],
        ),
        bottomSheet:  GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
            },
            child: Container(
              height: 80,
              color: kPurple,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25)),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 50,
                        width: 200,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: cartList.length == null
                                ? Text('')
                                : cartList.map((i) =>  Card(
                                child: Padding(
                                    padding: EdgeInsets.all(5),child: Image.asset(product[i].photo)))).toList()
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      color: kYellow,
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                              cartList.length == null
                                  ? '0'
                                  : cartList.length.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kPurple))),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

