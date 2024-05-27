import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potatotimer/index.dart';

void main() {
  testWidgets('HomeAppbar has the correct title and styles',
      (WidgetTester tester) async {
    const testTitle = 'Mock Text';

    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(124),
            child: HomeAppbar(title: testTitle),
          ),
        ),
      ),
    );

    // Verify that AppBar contains correct title and styles
    expect(find.text(testTitle), findsOneWidget);

    final textWidget = tester.widget<Text>(find.text(testTitle));
    expect(textWidget.style?.color, Colors.white);
    expect(
        textWidget.style?.fontSize,
        Theme.of(tester.element(find.text(testTitle)))
            .textTheme
            .headlineLarge
            ?.fontSize);

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);

    final appBarWidget = tester.widget<AppBar>(appBar);
    expect(appBarWidget.backgroundColor, AppColors.primaryGreenColor);
  });
}
