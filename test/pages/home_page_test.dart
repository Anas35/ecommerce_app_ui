import 'package:ecommerce_app_ui/pages/home_page.dart';
import 'package:ecommerce_app_ui/src/data.dart';
import 'package:ecommerce_app_ui/widgets/cart_sheet.dart';
import 'package:ecommerce_app_ui/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('HomePage', (WidgetTester tester) async {

    late DataWidgetState state;

    await tester.pumpWidget(
      DataWidget(
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              state = DataWidget.of(context);
              return const HomePage();
            }
          ),
        ),
      ),
    );

    expect(tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor, const Color(0xFFe3e3e3));

    AppBar appBar = tester.widget<AppBar>(find.byType(AppBar));

    expect(appBar.backgroundColor, Colors.transparent);
    expect(appBar.title is Text, true);
    expect(appBar.actions?.length, 1);
    expect(appBar.actions?.first is IconButton, true);

    Text text = tester.widget<Text>(find.descendant(of: find.byType(AppBar), matching: find.byType(Text)));
    expect(text.data, 'Dairy Milk');
    expect(text.style?.color, Colors.black);
    expect(text.style?.fontWeight, FontWeight.bold);

    IconButton iconButton = tester.widget<IconButton>(find.descendant(of: find.byType(AppBar), matching: find.byType(IconButton)));
    expect((iconButton.icon as Icon).icon, Icons.favorite);
    expect((iconButton.icon as Icon).color, const Color(0xFF7b4b93));

    GridView gridView = tester.widget<GridView>(find.byType(GridView));
    expect(gridView.padding,  const EdgeInsets.only(bottom: 80));
    expect(find.byType(ProductCard), findsNWidgets(state.productList.length));

    List<Column> columns = tester.widgetList<Column>(find.byType(Column)).toList();

    for (var i = 0; i < columns.length; i++) {
      if(i.isOdd) {
        columns[i].children.first == const SizedBox(height: 25);
      } else {
        columns[i].children.first == const SizedBox.shrink();
      }

      if(i.isOdd) {
        columns[i].children.last == const SizedBox.shrink();
      } else {
        columns[i].children.last == const SizedBox(height: 25);
      }
    }

    expect(find.byType(CartSheet), findsOneWidget);
    expect(find.descendant(of: find.byType(CartSheet), matching: find.byType(Image)), findsNothing);

    await tester.tap(
      find.descendant(of: find.byType(GridView), matching: find.byType(GestureDetector)).first
    );
    await tester.pumpAndSettle();
  
    await tester.tap(find.text('Add to Cart'));
    await tester.pump();

    expect(find.descendant(of: find.byType(CartSheet), matching: find.byType(Image)), findsOneWidget);

  });
  
}