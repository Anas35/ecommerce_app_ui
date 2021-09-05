import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Show Product List', (WidgetTester tester) async {

    late int length;

    final Widget showProductList = Scaffold(
      body: Builder(
        builder: (BuildContext context) {

          final List<Product> productList = DataWidget.of(context).productList;
          length = productList.length;

          return ListView(
            children: productList.map((Product p) => Text(p.name)).toList(),
          );
        }
      ),
    );

    Widget buildframe() {
      return DataWidget(
        child: MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                child: const Text('Click'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => showProductList)),
              );
            }
          ),
        ),
      );
    }

    await tester.pumpWidget(buildframe());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Click'));
    await tester.pumpAndSettle();

    expect(find.byType(Text), findsNWidgets(length));

  });
  
  group('Show CartList', () {

    final Widget showCartList = Scaffold(
      body: Builder(
        builder: (BuildContext context) {

          final List<Product> cartList = DataWidget.of(context).cartList;

          return cartList.isEmpty ? const SizedBox.shrink() : ListView(
            children: cartList.map((Product p) => Text(p.name)).toList(),
          );
        }
      ),
    );

    final Product product = Product(id: 1, photo: 'photo', cost: 10, name: 'name', gram: 10, quantity: 1, description: 'description');

    Widget buildframe() {
      return DataWidget(
        child: MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Column(
                children: [
                  ElevatedButton(
                    child: const Text('Navigate to CartList'),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => showCartList)),
                  ),
                  ElevatedButton(
                    child: const Text('Add Product to CartList'),
                    onPressed: () => DataWidget.of(context).addToCart(product),
                  ),
                  ElevatedButton(
                    child: const Text('Remove Product from CartList'),
                    onPressed: () => DataWidget.of(context).removeFromCart(product),
                  ),
                ],
              );
            }
          ),
        ),
      );
    }

    testWidgets('Initial Cart', (WidgetTester tester) async {

      await tester.pumpWidget(buildframe());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Navigate to CartList'));
      await tester.pumpAndSettle();

      expect(find.byType(Text), findsNothing);

    });

    testWidgets('Add Cart', (WidgetTester tester) async {

      await tester.pumpWidget(buildframe());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add Product to CartList'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Navigate to CartList'));
      await tester.pumpAndSettle();

      expect(find.byType(Text), findsOneWidget);

    });

    
    testWidgets('Remove Cart', (WidgetTester tester) async {

      await tester.pumpWidget(buildframe());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Remove Product from CartList'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Navigate to CartList'));
      await tester.pumpAndSettle();

      expect(find.byType(Text), findsNothing);

    });

  });
}