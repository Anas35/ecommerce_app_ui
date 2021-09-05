import 'package:ecommerce_app_ui/widgets/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Circular Button', (WidgetTester tester) async {

    bool isTap = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircularButton(
            text: 'Hello',
            onPressed: () {
              isTap = true;
            },
          ),
        ),
      ),
    );

    final Finder buttonMaterial = find.descendant(
      of: find.byType(ElevatedButton),
      matching: find.byType(Material),
    );

    Material material = tester.widget<Material>(buttonMaterial);

    RoundedRectangleBorder roundedRectangleBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        bottomLeft: Radius.circular(16.0),
      ),
    );

    expect(tester.getSize(buttonMaterial), const Size(200,55));
    expect(material.color, const Color(0xFFd8a046));
    expect(material.textStyle?.fontSize, 20);
    expect(material.textStyle?.fontWeight, FontWeight.bold);
    expect(material.shape, roundedRectangleBorder);
    expect(find.text('Hello'), findsOneWidget);

    expect(isTap, false);

    await tester.tap(find.text('Hello'));
    
    expect(isTap, true);
   
  });
  
}