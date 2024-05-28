import 'package:audioplayers/audioplayers.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:potatotimer/index.dart';
import 'package:test/test.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TaskDatabase? database;

  setUp(() {
    database = TaskDatabase(NativeDatabase.memory());
  });

  setUpAll(() {
    registerFallbackValue(TaskItemsCompanion(
      title: const Value("Task1"),
      description: const Value("Boil potato"),
      hours: const Value(0),
      minutes: const Value(10),
      seconds: const Value(30),
      currentTime: Value(DateTime(0, 0, 0, 0, 10, 30)),
      remainingTime: const Value(0 * 3600 + 10 * 60 + 30),
    ));
  });

  tearDown(() async {
    await database!.close();
  });

  group('PotatoTimerStore', () {
    test('fetchTasks gives List of created Task', () async {
      //Arrange
      final store = PotatoTimerStore(database!);
      List<TaskData> savedTask = await database!.allTasks;

      // Act
      await store.fetchTasks();

      // Assert
      expect(store.taskList.value, equals(savedTask));
    });

    test('addTask should insert task and fetch tasks', () async {
      //Arrange
      final store = PotatoTimerStore(database!);

      //act
      await store.addTask('Test Task', 'Test Description', 1, 0, 0);
      await store.fetchTasks();

      //assert
      expect(store.taskList.value.length, 1);
      expect(store.taskList.value.first.title, 'Test Task');
    });
  });

  test('removeTask should remove a task and fetch tasks', () async {
    //Arrange
    final store = PotatoTimerStore(database!);

    //act
    await store.addTask('Test Task', 'Test Description', 1, 0, 0);
    await store.fetchTasks();
    await store.removeTask(store.taskList.value.first);
    await store.fetchTasks();

    //assert
    expect(store.taskList.value.length, 0);
  });
  test('updateTask should update a task and fetch tasks', () async {
    //Arrange
    final store = PotatoTimerStore(database!);

    //act
    await store.addTask('Test Task', 'Test Description', 1, 0, 0);
    await store.fetchTasks();
    var taskToUpdate = store.taskList.value.first;
    taskToUpdate = taskToUpdate.copyWith(
      title: 'Updated Task',
      remainingTime: 1800,
    );

    await store.updateTask(taskToUpdate);
    await store.fetchTasks();

    //Assert
    expect(store.taskList.value.first.title, 'Updated Task');
    expect(store.taskList.value.first.remainingTime, 1800);
  });

  test('pauseTimer should set isRunning to false', () async {
    //Arrange
    final store = PotatoTimerStore(database!);

    //act
    await store.addTask('Test Task', 'Test Description', 1, 0, 0);
    await store.fetchTasks();

    var taskToPause = store.taskList.value.first;

    await store.pauseTimer(taskToPause);
    await store.fetchTasks();

    //Assert
    expect(store.taskList.value.first.isRunning, false);
  });

  test('playTimer should set isRunning to true', () async {
    //Arrange
    final store = PotatoTimerStore(database!);

    //act
    await store.addTask('Test Task', 'Test Description', 1, 0, 0);
    await store.fetchTasks();
    var taskToPlay = store.taskList.value.first;
    await store.playTimer(taskToPlay);
    await store.fetchTasks();

    //Assert
    expect(store.taskList.value.first.isRunning, true);
  });
}
