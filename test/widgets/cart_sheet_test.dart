import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/src/product.dart';
import 'package:ecommerce_app_ui/widgets/cart_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Cart Sheet in HomePage', (WidgetTester tester) async {

    late DataWidgetState state;

    Widget buildframe() {
      return DataWidget(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (context) {
              state = DataWidget.of(context);
              return const CartSheet();
            }
          )
        ),
      );
    }

    await tester.pumpWidget(buildframe());
    
    Finder finder = find.ancestor(of: find.byType(Row), matching: find.byType(Container));

    expect(finder, findsOneWidget);

    Container container = tester.widget<Container>(finder);

    expect(container.padding, const EdgeInsets.all(8.0));
    expect(container.constraints?.minHeight, 80);
    expect(container.child.runtimeType, Row);

    BoxDecoration decoration = tester.widget<DecoratedBox>(
      find.ancestor(of: find.byType(Container), matching: find.byType(DecoratedBox))
    ).decoration as BoxDecoration;
    
    expect(decoration.gradient, const LinearGradient(colors: [ Color(0xFFc471ed), Color(0xFFf64f59)]));

    Row row = tester.widget<Row>(find.byType(Row));

    expect(row.mainAxisAlignment, MainAxisAlignment.spaceBetween);
    expect(row.children.length, 3);

    expect(find.text('Cart'), findsOneWidget);

    Text text = tester.widget<Text>(find.text('Cart'));

    expect(text.style?.fontSize, 25);
    expect(text.style?.fontWeight, FontWeight.bold);
    expect(text.style?.color, Colors.white);

    expect(state.cartList.isEmpty, true);
    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(Image), findsNothing);

    state.addToCart(
      Product(id: 4, photo: 'images/bubbly.jpg', cost: 175, name: 'Bubbly', gram: 120, quantity: 1, description: 'Description')
    );

    await tester.pumpWidget(buildframe());
    await tester.pumpAndSettle();

    expect(state.cartList.isEmpty, false);
    expect(find.byType(SizedBox), findsNothing);
    expect(find.byType(Image), findsOneWidget);

    Card card = tester.widget<Card>(
      find.ancestor(of: find.byType(Text), matching: find.byType(Card))
    );

    expect(card.color, const Color(0xFFd8a046));
    expect(find.text('${state.cartList.length}'), findsOneWidget);

    text = tester.widget<Text>(find.text('${state.cartList.length}'));

    expect(text.style?.fontWeight, FontWeight.w900);
    expect(text.style?.color, const Color(0xFF7b4b93));

  });
  
}