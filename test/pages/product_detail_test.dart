import 'package:ecommerce_app_ui/pages/product_detail.dart';
import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:ecommerce_app_ui/widgets/add_sheet.dart';
import 'package:ecommerce_app_ui/widgets/quantity_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Product Details', (WidgetTester tester) async {

    Product product = Product(id: 4, photo: 'images/bubbly.jpg', cost: 175, name: 'Bubbly', gram: 120, quantity: 1, description: 'Description');

    await tester.pumpWidget(
      DataWidget(
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              return ProductDetail(
                product: product,
                isInCart: false,
              );
            }
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor, Colors.white);

    AppBar appBar = tester.widget<AppBar>(find.byType(AppBar));

    expect(appBar.backgroundColor, Colors.transparent);
    expect(appBar.leading is IconButton, true);
    expect(appBar.actions?.length, 1);
    expect(appBar.actions?.first is IconButton, true);

    expect(find.descendant(
      of: find.byType(SingleChildScrollView), matching: find.byType(Column)),
      findsOneWidget
    );

    AssetImage image = tester.widget<Image>(find.byType(Image)).image as AssetImage;
    expect(image.assetName, product.photo);

    Text title = tester.widget<Text>(find.text('Bubbly'));
    expect(title.style?.fontWeight, FontWeight.bold);
    expect(title.style?.fontSize, 30);

    Text gram = tester.widget<Text>(find.text(product.gram.toString() + 'g', skipOffstage: false));
    expect(gram.style?.fontWeight, FontWeight.w500);
    expect(gram.style?.color, Colors.grey[800]);

    expect(find.ancestor(of: find.byType(QuantityBox), matching: find.byType(Row)), findsOneWidget);
    expect(tester.widget<Row>(
      find.ancestor(of: find.byType(QuantityBox), matching: find.byType(Row))
    ).mainAxisAlignment, MainAxisAlignment.spaceEvenly);

    Text totalCost = tester.widget<Text>(find.text('₹' + product.cost.toString()));
    expect(totalCost.style?.fontWeight, FontWeight.bold);
    expect(totalCost.style?.fontSize, 20);

    expect(find.byType(QuantityBox), findsOneWidget);
    expect(find.text(product.quantity.toString()), findsOneWidget);

    Text descriptionHeader = tester.widget<Text>(find.text('About this Product'));
    expect(descriptionHeader.style?.fontWeight, FontWeight.bold);
    expect(descriptionHeader.style?.fontSize, 20);

    Text description = tester.widget<Text>(find.text(product.description));
    expect(description.style?.color, Colors.grey.shade800);
    expect(description.style?.fontSize, 18);
    expect(description.style?.height, 1.5);

    expect(find.byType(AddSheet), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
    expect(find.text('Remove from Cart'), findsNothing);

  });
}