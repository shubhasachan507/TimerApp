import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potatotimer/index.dart';

void main() {
  testWidgets('CustomTextField has correct title and validation',
      (WidgetTester tester) async {
    const testTitle = 'Mock text';
    final controller = TextEditingController();

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            title: testTitle,
            controller: controller,
          ),
        ),
      ),
    );

    // check for correct label
    expect(find.text(testTitle), findsOneWidget);

    expect(find.byType(TextFormField), findsOneWidget);
    expect(controller.text, isEmpty);

    // Verify validation message when input is empty
    await tester.enterText(find.byType(TextFormField), ' ');
    await tester.pump();

    expect(find.text('$testTitle is required.'), findsOneWidget);

    // Enter valid text and verify that nothing happens
    await tester.enterText(find.byType(TextFormField), 'Valid input');
    await tester.pump();

    expect(find.text('$testTitle is required.'), findsNothing);
  });
}
