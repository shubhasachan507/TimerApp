import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:potatotimer/index.dart';

// Mock class for PotatoTimerStore
class MockPotatoTimerStore extends Mock implements PotatoTimerStore {}

void main() {
  final getIt = GetIt.instance;
  setUpAll(() {
    registerFallbackValue(const TaskData(
      id: 0,
      title: "fallback",
      description: "Read Book",
      hours: 1,
      minutes: 10,
      seconds: 30,
      isRunning: true,
      remainingTime: 20,
    ));
  });

  setUp(() {
    getIt.reset();
  });

  testWidgets('MarkComplete widget test', (WidgetTester tester) async {
    final mockStore = MockPotatoTimerStore();

    // Use dependency injection to provide the mockStore instance
    getIt.registerSingleton<PotatoTimerStore>(mockStore);

    // Create a sample TaskData instance
    const task = TaskData(
      id: 1,
      title: "Task 1",
      description: "Read Book",
      hours: 1,
      minutes: 10,
      seconds: 30,
      isRunning: true,
      remainingTime: 20,
    );

    when(() => mockStore.stopSound()).thenAnswer((_) async {});
    when(() => mockStore.removeTask(any())).thenAnswer((_) async {});

    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MarkComplete(task: task),
        ),
      ),
    );

    // Verify that the widget is built correctly
    expect(find.text(AppStrings.markComplete), findsOneWidget);

    // Tap the widget
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // Verify the interactions with the mockStore
    verify(() => mockStore.stopSound()).called(1);
    verify(() => mockStore.removeTask(task)).called(1);
  });
}
