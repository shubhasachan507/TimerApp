import 'package:drift/drift.dart';

@DataClassName('TaskData')
class TaskItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 200)();
  TextColumn get description => text().withLength(min: 1, max: 500)();
  IntColumn get hours => integer()();
  IntColumn get minutes => integer()();
  IntColumn get seconds => integer()();
  BoolColumn get isRunning => boolean().withDefault(const Constant(true))();
  IntColumn get remainingTime => integer().withDefault(const Constant(0))();
  DateTimeColumn get currentTime => dateTime().nullable()();
}
