import 'package:ecommerce_app_ui/src/product.dart';
import 'package:ecommerce_app_ui/widgets/horizontal_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Product View in Cart Page', (WidgetTester tester) async {

    final List<Product> cartList = [
      Product(id: 4, photo: 'images/bubbly.jpg', cost: 175, name: 'Bubbly', gram: 120, quantity: 1, description: 'Description'),
      Product(id: 5, photo: 'images/hazelnut.jpg', cost: 350, name: 'Halzenut', gram: 240, quantity: 5, description: 'Description')
    ];

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              HorizontalProduct(cartList),
            ],
          );
        },
      ),
    ));

    expect(find.byType(ListView), findsOneWidget);
    
    Finder finder = find.ancestor(of: find.byType(Row), matching: find.byType(Container));
    List<Container> containers = tester.widgetList<Container>(finder).toList();

    expect(containers.length, cartList.length);

    for (int i = 0; i < containers.length; i++) {

      Container container = containers[i];
      expect(container.padding, const EdgeInsets.all(8.0));

      BoxDecoration decoration = tester.widgetList<DecoratedBox>(find.byType(DecoratedBox)).toList()[i].decoration as BoxDecoration;

      expect(decoration.border, Border.all());
      expect(decoration.color, Colors.black38);
      expect(decoration.borderRadius, BorderRadius.circular(16.0));

      expect(container.child.runtimeType, Row);

      List<Row> rows = tester.widgetList<Row>(find.byType(Row)).toList();
      expect(rows.length, cartList.length);

      expect(rows[i].children.length, 4);

      List<SizedBox> sizedBoxs = tester.widgetList<SizedBox>(
        find.ancestor(of: find.byType(Card), matching: find.byType(SizedBox))
      ).toList();
      expect(sizedBoxs.length, cartList.length);
      
      expect(sizedBoxs[i].height, 75);
      expect(sizedBoxs[i].width, 75);
      expect(sizedBoxs[i].child.runtimeType, Card);

      List<Image> images = tester.widgetList<Image>(
      find.descendant(of: find.byType(Card), matching: find.byType(Image))
      ).toList();
      expect(images.length, cartList.length);

      expect((images[i].image as AssetImage).assetName, cartList[i].photo);

      expect(find.text(cartList[i].quantity.toString() + ' x'), findsOneWidget);
      Text text = tester.widget<Text>(find.text(cartList[i].quantity.toString() + ' x'));

      expect(text.style?.fontWeight, FontWeight.bold);
      expect(text.style?.color, Colors.white);

      sizedBoxs = tester.widgetList<SizedBox>(
        find.ancestor(of: find.byType(Center), matching: find.byType(SizedBox))
      ).toList();
      expect(sizedBoxs.length, cartList.length);

      expect(sizedBoxs[i].height, 50);
      expect(sizedBoxs[i].width, 100);
      expect(sizedBoxs[i].child.runtimeType, Center);

      expect(find.text(cartList[i].name), findsOneWidget);
      text = tester.widget<Text>(find.text(cartList[i].name));

      expect(text.style?.fontWeight, FontWeight.bold);
      expect(text.style?.color, Colors.white);

      expect(find.text('₹' + cartList[i].cost.toString()), findsOneWidget);
      text = tester.widget<Text>(find.text('₹' + cartList[i].cost.toString()));

      expect(text.style?.fontWeight, FontWeight.bold);
      expect(text.style?.color, Colors.white);

    }

  });
  
}