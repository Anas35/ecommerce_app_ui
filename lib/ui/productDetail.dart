import 'package:flutter/material.dart';
import 'package:shopping_ui/data/productList.dart';
import '../const.dart';

class ProductDetail extends StatefulWidget {

  ProductDetail(this.index);
  final int index;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int quantity = 1;

  @override
  Widget build(BuildContext context) {

    int index = widget.index;

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
                Text(product[index].gram.toString() + 'g', style: TextStyle(color: Colors.grey[800]),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('\uFF04'+product[index].cost.toString(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Container(
                            padding: EdgeInsets.all(12),
                            height: 45,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(color: Colors.grey[400]),
                            ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      child: Icon(Icons.remove),
                                      onTap: (){
                                         setState(() {
                                            if(quantity > 1) quantity--;
                                          });},
                                  ),
                                  Text(quantity.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                  GestureDetector(
                                      child: Icon(Icons.add),
                                    onTap: (){
                                      setState(() {
                                        if(quantity >= 1) quantity++;
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
                style: TextStyle(height: 1.5, color: Colors.grey[800], fontSize: 18)),
                SizedBox(height: 80,)
              ],
            ),
          ),
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
                      setState(() {
                        product[index].quantity = quantity;
                      });
                      Navigator.pop(context,index);
                    }
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
      ),
    );
  }
}
