import 'package:ecommerce_app_ui/widgets/quantity_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Quantity box', (WidgetTester tester) async {

    await tester.pumpWidget(const _MockClass());

    Container container = tester.widget<Container>(find.byType(Container));

    expect(container.constraints, const BoxConstraints(
      minWidth: 120, maxWidth: 120, maxHeight: 45, minHeight: 45
    ));
    expect(container.padding, const EdgeInsets.all(12));
    expect(container.child.runtimeType, Row);

    BoxDecoration decoration = tester.widget<DecoratedBox>(find.byType(DecoratedBox)).decoration as BoxDecoration;

    expect(decoration.color, Colors.white);
    expect(decoration.borderRadius, BorderRadius.circular(18.0));
    expect(decoration.border, Border.all(color: Colors.grey));

    expect(find.byType(Row), findsOneWidget);
    expect(find.text('1'), findsOneWidget);

    Text text = tester.widget<Text>(find.text('1'));
    expect(text.style?.fontWeight, FontWeight.bold);
    expect(text.style?.fontSize, 18);

    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);

  });

  testWidgets('Change Text', (WidgetTester tester) async {

    await tester.pumpWidget(const _MockClass());

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsNothing);

  });
}

class _MockClass extends StatefulWidget {
  const _MockClass({ Key? key }) : super(key: key);

  @override
  __MockClassState createState() => __MockClassState();
}

class __MockClassState extends State<_MockClass> {

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Builder(
        builder: (context) {
          return QuantityBox(
            quantity: quantity,
            onIncrement: () => setState(() => quantity++),
            onDecrement: () => setState(() => quantity--),
          );
        }
      ),
    );
  }
}