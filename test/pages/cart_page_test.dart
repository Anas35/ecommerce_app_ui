import 'package:ecommerce_app_ui/pages/cart_page.dart';
import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:ecommerce_app_ui/widgets/circular_button.dart';
import 'package:ecommerce_app_ui/widgets/horizontal_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  late DataWidgetState state;

  testWidgets('Product Details', (WidgetTester tester) async {
    await tester.pumpWidget(
      DataWidget(
        child: MaterialApp(
          home: Builder(
            builder: (context) {

              state = DataWidget.of(context);

              return const Cart();
            }
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    
    expect(tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor, Colors.transparent);

    AppBar appBar = tester.widget<AppBar>(find.byType(AppBar));

    expect(appBar.backgroundColor, Colors.transparent);
    expect(appBar.title is Text, true);
    expect(appBar.leading is IconButton, true);

    BoxDecoration decoration = tester.widget<DecoratedBox>(
      find.ancestor(of: find.byType(SafeArea), matching: find.byType(DecoratedBox))
    ).decoration as BoxDecoration;
    
    expect(decoration.gradient, const LinearGradient(colors: [ Color(0xFFc471ed), Color(0xFFf64f59) ]));
    expect(find.byType(Column), findsOneWidget);

    expect(find.byType(HorizontalProduct), findsNWidgets(state.cartList.length));

    expect(find.text('Cart is Empty'), findsOneWidget);
    Text text = tester.widget<Text>(find.text('Cart is Empty'));
    expect(text.style?.color, Colors.white);
    expect(text.style?.fontWeight, FontWeight.bold);
    expect(text.style?.fontSize, 30);

    expect(find.byType(CircularButton), findsNothing);

    state.addToCart(Product(id: 4, photo: 'images/bubbly.jpg', cost: 175, name: 'Bubbly', gram: 120, quantity: 1, description: 'Description'));

    await tester.pumpAndSettle();

    expect(find.text('Cart is Empty'), findsNothing);
    expect(find.byType(CircularButton), findsOneWidget);
    
  });
}