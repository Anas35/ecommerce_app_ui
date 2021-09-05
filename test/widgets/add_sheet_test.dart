import 'package:ecommerce_app_ui/widgets/add_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Add to Cart Bottom Sheet', (WidgetTester tester) async {

    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.ltr,
      child: AddSheet(circularButton: SizedBox())
    ));

    Finder finder = find.ancestor(of: find.byType(Row), matching: find.byType(Container));

    expect(finder, findsOneWidget);

    Container container = tester.widget<Container>(finder);

    expect(container.decoration, const BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.black38))));
    expect(container.padding, const EdgeInsets.symmetric(vertical: 8.0));
    expect(container.child.runtimeType, Row);

    Row row = tester.widget<Row>(find.byType(Row));

    expect(row.mainAxisAlignment, MainAxisAlignment.spaceBetween);
    expect(row.children.length, 3);

    expect(find.byType(Card), findsOneWidget);

    Card card = tester.widget<Card>(find.byType(Card));
    expect(card.color, const Color(0xFF7b4b93));

    finder = find.descendant(of: find.byType(Card), matching: find.byType(Icon));
    Icon icon = tester.widget<Icon>(finder);

    expect(icon.icon, Icons.favorite);

  });
  
}