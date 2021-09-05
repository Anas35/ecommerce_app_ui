import 'package:ecommerce_app_ui/main.dart';
import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/widgets/cart_sheet.dart';
import 'package:ecommerce_app_ui/widgets/horizontal_product_view.dart';
import 'package:ecommerce_app_ui/widgets/product_cart.dart';
import 'package:ecommerce_app_ui/widgets/quantity_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/*
flutter drive --driver=test_driver/integration_test.dart  --target=integration_test/ecommerce_app_ui_test.dart
*/

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Ecommerce App UI', (WidgetTester tester) async {

    late DataWidgetState state;

    await tester.pumpWidget(DataWidget(
      child: Builder(
        builder: (context) {
          state = DataWidget.of(context);
          return const MyApp();
        }
      ),
    ));
    await tester.pumpAndSettle();

    ///Verify we're in HomePage
    expect(find.byKey(const Key('HomePage')), findsOneWidget);

    ///Check the number of ProductCard in HomePage
    expect(find.byType(ProductCard), findsNWidgets(state.productList.length));

    ///Tap at first ProductCard
    await tester.tap(find.byType(ProductCard).first);
    await tester.pumpAndSettle();

    ///Verify that it Navigate to ProductDetail Page
    expect(find.byKey(const Key('HomePage')), findsNothing);
    expect(find.byKey(const Key('ProductDetail')), findsOneWidget);

    ///check if the number of quantity is equal to product quantity
    expect(
      tester.widget<Text>(find.descendant(of: find.byType(QuantityBox), matching: find.byType(Text))).data,
    '${state.productList[0].quantity}');

    ///increase the quantity and save before cost and quantity
    double preCost = state.productList[0].cost;
    int preQuantity = state.productList[0].quantity;

    await tester.tap(find.descendant(of: find.byType(QuantityBox), matching: find.byIcon(Icons.add)));
    await tester.pumpAndSettle();

    ///verify the cost and quantity
    preQuantity += 1;
    expect(find.text(preQuantity.toString()), findsOneWidget);
    expect(find.text('₹' + (preQuantity * preCost).toString()), findsOneWidget);

    ///Navigate back to Homepage
    await tester.tap(find.text('Add to Cart'));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('HomePage')), findsOneWidget);
    expect(find.byKey(const Key('ProductDetail')), findsNothing);

    ///Navigate back to Same Product Details Page to check if its in Cart
    await tester.tap(find.byType(ProductCard).first);
    await tester.pumpAndSettle();

    expect(find.text('Add to Cart'), findsNothing);
    expect(find.text('Remove from Cart'), findsOneWidget);

    ///Navigate to Home Page
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('HomePage')), findsOneWidget);
    expect(find.byKey(const Key('ProductDetail')), findsNothing);

    ///check bottom sheet to contain image
    expect(find.descendant(of: find.byType(CartSheet), matching: find.byType(Image)), findsNWidgets(state.cartList.length));
    expect(find.descendant(of: find.byType(CartSheet), matching: find.text('${state.cartList.length}')), findsOneWidget);

    ///Navigate to CartPage
    await tester.tap(find.byType(CartSheet));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('HomePage')), findsNothing);
    expect(find.byKey(const Key('Cart')), findsOneWidget);

    expect(find.byType(HorizontalProduct), findsNWidgets(state.cartList.length));
    
    double total() {
      double totalCost = 0;
      for (var product in state.cartList) {
        totalCost += product.cost;
      }
      return totalCost;
    }

    expect(find.text('₹' + total().toString()), findsWidgets);

    ///Navigate back to Homepage and remove product in cartList
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ProductCard).first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Remove from Cart'));
    await tester.pumpAndSettle();

    expect(find.descendant(of: find.byType(CartSheet), matching: find.byType(Image)), findsNothing);

  });
}