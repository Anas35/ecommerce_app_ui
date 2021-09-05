
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:ecommerce_app_ui/widgets/product_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Product View in Homepage', (WidgetTester tester) async {

    Product product = Product(
      id: 4, photo: 'images/bubbly.jpg', cost: 175, name: 'Bubbly', gram: 120, quantity: 1, description: 'Description',
    );

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: Builder(
        builder: (context) {
          return ProductCard(product: product);
        }
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.byType(Card), findsOneWidget);

    Finder finder = find.descendant(of: find.byType(Card), matching: find.byType(Column));
    expect(finder, findsOneWidget);

    finder = find.descendant(of: find.byType(Align), matching: find.byType(Image));
    AssetImage image = tester.widget<Image>(finder).image as AssetImage;

    expect(image.assetName, product.photo);

    Align align = tester.widget<Align>(find.byType(Align));
    expect(align.alignment, Alignment.center);

    expect(find.text('₹' + product.cost.toString()), findsOneWidget);
    Text text = tester.widget<Text>(find.text('₹' + product.cost.toString()));

    expect(text.style?.fontWeight, FontWeight.bold);
    expect(text.style?.fontSize, 20);

    expect(find.text(product.name), findsOneWidget);
    text = tester.widget<Text>(find.text(product.name));

    expect(text.style?.fontWeight, FontWeight.bold);
    expect(text.style?.color, Colors.black);

    expect(find.text(product.gram.toString() + 'g'), findsOneWidget);
    text = tester.widget<Text>(find.text(product.gram.toString() + 'g'));

    expect(text.style?.color, Colors.grey[800]);

  });

}