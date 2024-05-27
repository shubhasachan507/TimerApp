import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potatotimer/widgets/custom_fab.dart';

void main() {
  testWidgets('CustomFloatingActionButton has an icon and responds to taps',
      (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomFloatingActionButton(
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(pressed, isTrue);
  });
}
