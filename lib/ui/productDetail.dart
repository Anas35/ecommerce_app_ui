import 'package:flutter/material.dart';
import 'package:shopping_ui/data/productList.dart';
import 'package:shopping_ui/ui/homePage.dart';
import '../const.dart';

class ProductDetail extends StatefulWidget {

  ProductDetail(this.num);
  final int num;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int number = 1;

  @override
  Widget build(BuildContext context) {

    int index = widget.num;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){Navigator.pop(context);}),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: kPurple),),
          ],
        ),
        bottomSheet:
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10,),
                      Card(
                        color: kPurple,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.favorite, color: Colors.white, size: 25,),
                      )
                      ),
                      ButtonTheme(
                       height: 55,
                       minWidth: 200,
                       child: RaisedButton(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(16.0),
                             bottomLeft: Radius.circular(16.0),
                           ),
                         ),
                        color: kYellow,
                          child: Text('Add to cart', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          onPressed: (){
                           print(index);
                           Navigator.of(context).push(MaterialPageRoute(builder:(context)=> HomePage(index, number))); }
                          ), ),
                    ],
                  ),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0, 0.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                ),
        body: SingleChildScrollView(
             child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(product[index].photo)),
                SizedBox(
                  height: 15,
                ),
                Text(product[index].name, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),),
                SizedBox(height: 10,),
                Text(product[index].gram.toString() + 'g', style: TextStyle(color: Colors.grey[400]),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('\uFF04'+product[index].cost.toString(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Container(
                            padding: EdgeInsets.all(12),
                            height: 45,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(color: Colors.grey[400]),
                            ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                      child: Text('-', style: kBoldText,),
                                      onTap: (){
                                         setState(() {
                                            if(number > 1) number--;
                                          });},
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(number.toString(), style: kBoldText,)),
                                  GestureDetector(
                                      child: Text(' + ', style: kBoldText,),
                                    onTap: (){
                                      setState(() {
                                        if(number >= 1) number++;
                                      });},
                                  ),
                                ],
                              ),
                             )

                    ],
                  ),
                SizedBox(height: 50,),
                Text('About this Product',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                Text('Healthy plant-based foods, snacks & meal replacements. Best organic plant based protein bars, shakes and powders. Nothing artificial.',
                style: TextStyle(height: 1.5)),
                SizedBox(height: 80,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
