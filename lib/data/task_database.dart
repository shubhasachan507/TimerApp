import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../index.dart';

part 'task_database.g.dart';

@DriftDatabase(tables: [TaskItems])
class TaskDatabase extends _$TaskDatabase {
  TaskDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<TaskData>> get allTasks => select(taskItems).get();
  Stream<List<TaskData>> watchAllTasks() => select(taskItems).watch();
  Future<int> insertTask(Insertable<TaskData> task) =>
      into(taskItems).insert(task);
  Future updateTask(Insertable<TaskData> task) =>
      update(taskItems).replace(task);
  Future deleteTask(Insertable<TaskData> task) =>
      delete(taskItems).delete(task);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
