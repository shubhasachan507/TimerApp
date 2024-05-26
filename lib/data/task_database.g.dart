// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_database.dart';

// ignore_for_file: type=lint
class $TaskItemsTable extends TaskItems
    with TableInfo<$TaskItemsTable, TaskData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 250),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hoursMeta = const VerificationMeta('hours');
  @override
  late final GeneratedColumn<int> hours = GeneratedColumn<int>(
      'hours', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _minutesMeta =
      const VerificationMeta('minutes');
  @override
  late final GeneratedColumn<int> minutes = GeneratedColumn<int>(
      'minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _secondsMeta =
      const VerificationMeta('seconds');
  @override
  late final GeneratedColumn<int> seconds = GeneratedColumn<int>(
      'seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isRunningMeta =
      const VerificationMeta('isRunning');
  @override
  late final GeneratedColumn<bool> isRunning = GeneratedColumn<bool>(
      'is_running', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_running" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _remainingTimeMeta =
      const VerificationMeta('remainingTime');
  @override
  late final GeneratedColumn<int> remainingTime = GeneratedColumn<int>(
      'remaining_time', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _currentTimeMeta =
      const VerificationMeta('currentTime');
  @override
  late final GeneratedColumn<DateTime> currentTime = GeneratedColumn<DateTime>(
      'current_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        hours,
        minutes,
        seconds,
        isRunning,
        remainingTime,
        currentTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_items';
  @override
  VerificationContext validateIntegrity(Insertable<TaskData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('hours')) {
      context.handle(
          _hoursMeta, hours.isAcceptableOrUnknown(data['hours']!, _hoursMeta));
    } else if (isInserting) {
      context.missing(_hoursMeta);
    }
    if (data.containsKey('minutes')) {
      context.handle(_minutesMeta,
          minutes.isAcceptableOrUnknown(data['minutes']!, _minutesMeta));
    } else if (isInserting) {
      context.missing(_minutesMeta);
    }
    if (data.containsKey('seconds')) {
      context.handle(_secondsMeta,
          seconds.isAcceptableOrUnknown(data['seconds']!, _secondsMeta));
    } else if (isInserting) {
      context.missing(_secondsMeta);
    }
    if (data.containsKey('is_running')) {
      context.handle(_isRunningMeta,
          isRunning.isAcceptableOrUnknown(data['is_running']!, _isRunningMeta));
    }
    if (data.containsKey('remaining_time')) {
      context.handle(
          _remainingTimeMeta,
          remainingTime.isAcceptableOrUnknown(
              data['remaining_time']!, _remainingTimeMeta));
    }
    if (data.containsKey('current_time')) {
      context.handle(
          _currentTimeMeta,
          currentTime.isAcceptableOrUnknown(
              data['current_time']!, _currentTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      hours: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hours'])!,
      minutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}minutes'])!,
      seconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seconds'])!,
      isRunning: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_running'])!,
      remainingTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remaining_time'])!,
      currentTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}current_time']),
    );
  }

  @override
  $TaskItemsTable createAlias(String alias) {
    return $TaskItemsTable(attachedDatabase, alias);
  }
}

class TaskData extends DataClass implements Insertable<TaskData> {
  final int id;
  final String title;
  final String description;
  final int hours;
  final int minutes;
  final int seconds;
  final bool isRunning;
  final int remainingTime;
  final DateTime? currentTime;
  const TaskData(
      {required this.id,
      required this.title,
      required this.description,
      required this.hours,
      required this.minutes,
      required this.seconds,
      required this.isRunning,
      required this.remainingTime,
      this.currentTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['hours'] = Variable<int>(hours);
    map['minutes'] = Variable<int>(minutes);
    map['seconds'] = Variable<int>(seconds);
    map['is_running'] = Variable<bool>(isRunning);
    map['remaining_time'] = Variable<int>(remainingTime);
    if (!nullToAbsent || currentTime != null) {
      map['current_time'] = Variable<DateTime>(currentTime);
    }
    return map;
  }

  TaskItemsCompanion toCompanion(bool nullToAbsent) {
    return TaskItemsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      hours: Value(hours),
      minutes: Value(minutes),
      seconds: Value(seconds),
      isRunning: Value(isRunning),
      remainingTime: Value(remainingTime),
      currentTime: currentTime == null && nullToAbsent
          ? const Value.absent()
          : Value(currentTime),
    );
  }

  factory TaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      hours: serializer.fromJson<int>(json['hours']),
      minutes: serializer.fromJson<int>(json['minutes']),
      seconds: serializer.fromJson<int>(json['seconds']),
      isRunning: serializer.fromJson<bool>(json['isRunning']),
      remainingTime: serializer.fromJson<int>(json['remainingTime']),
      currentTime: serializer.fromJson<DateTime?>(json['currentTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'hours': serializer.toJson<int>(hours),
      'minutes': serializer.toJson<int>(minutes),
      'seconds': serializer.toJson<int>(seconds),
      'isRunning': serializer.toJson<bool>(isRunning),
      'remainingTime': serializer.toJson<int>(remainingTime),
      'currentTime': serializer.toJson<DateTime?>(currentTime),
    };
  }

  TaskData copyWith(
          {int? id,
          String? title,
          String? description,
          int? hours,
          int? minutes,
          int? seconds,
          bool? isRunning,
          int? remainingTime,
          Value<DateTime?> currentTime = const Value.absent()}) =>
      TaskData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        hours: hours ?? this.hours,
        minutes: minutes ?? this.minutes,
        seconds: seconds ?? this.seconds,
        isRunning: isRunning ?? this.isRunning,
        remainingTime: remainingTime ?? this.remainingTime,
        currentTime: currentTime.present ? currentTime.value : this.currentTime,
      );
  @override
  String toString() {
    return (StringBuffer('TaskData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('hours: $hours, ')
          ..write('minutes: $minutes, ')
          ..write('seconds: $seconds, ')
          ..write('isRunning: $isRunning, ')
          ..write('remainingTime: $remainingTime, ')
          ..write('currentTime: $currentTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, hours, minutes,
      seconds, isRunning, remainingTime, currentTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.hours == this.hours &&
          other.minutes == this.minutes &&
          other.seconds == this.seconds &&
          other.isRunning == this.isRunning &&
          other.remainingTime == this.remainingTime &&
          other.currentTime == this.currentTime);
}

class TaskItemsCompanion extends UpdateCompanion<TaskData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> hours;
  final Value<int> minutes;
  final Value<int> seconds;
  final Value<bool> isRunning;
  final Value<int> remainingTime;
  final Value<DateTime?> currentTime;
  const TaskItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.hours = const Value.absent(),
    this.minutes = const Value.absent(),
    this.seconds = const Value.absent(),
    this.isRunning = const Value.absent(),
    this.remainingTime = const Value.absent(),
    this.currentTime = const Value.absent(),
  });
  TaskItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required int hours,
    required int minutes,
    required int seconds,
    this.isRunning = const Value.absent(),
    this.remainingTime = const Value.absent(),
    this.currentTime = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        hours = Value(hours),
        minutes = Value(minutes),
        seconds = Value(seconds);
  static Insertable<TaskData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? hours,
    Expression<int>? minutes,
    Expression<int>? seconds,
    Expression<bool>? isRunning,
    Expression<int>? remainingTime,
    Expression<DateTime>? currentTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (hours != null) 'hours': hours,
      if (minutes != null) 'minutes': minutes,
      if (seconds != null) 'seconds': seconds,
      if (isRunning != null) 'is_running': isRunning,
      if (remainingTime != null) 'remaining_time': remainingTime,
      if (currentTime != null) 'current_time': currentTime,
    });
  }

  TaskItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<int>? hours,
      Value<int>? minutes,
      Value<int>? seconds,
      Value<bool>? isRunning,
      Value<int>? remainingTime,
      Value<DateTime?>? currentTime}) {
    return TaskItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
      isRunning: isRunning ?? this.isRunning,
      remainingTime: remainingTime ?? this.remainingTime,
      currentTime: currentTime ?? this.currentTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (hours.present) {
      map['hours'] = Variable<int>(hours.value);
    }
    if (minutes.present) {
      map['minutes'] = Variable<int>(minutes.value);
    }
    if (seconds.present) {
      map['seconds'] = Variable<int>(seconds.value);
    }
    if (isRunning.present) {
      map['is_running'] = Variable<bool>(isRunning.value);
    }
    if (remainingTime.present) {
      map['remaining_time'] = Variable<int>(remainingTime.value);
    }
    if (currentTime.present) {
      map['current_time'] = Variable<DateTime>(currentTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('hours: $hours, ')
          ..write('minutes: $minutes, ')
          ..write('seconds: $seconds, ')
          ..write('isRunning: $isRunning, ')
          ..write('remainingTime: $remainingTime, ')
          ..write('currentTime: $currentTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$TaskDatabase extends GeneratedDatabase {
  _$TaskDatabase(QueryExecutor e) : super(e);
  _$TaskDatabaseManager get managers => _$TaskDatabaseManager(this);
  late final $TaskItemsTable taskItems = $TaskItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskItems];
}

typedef $$TaskItemsTableInsertCompanionBuilder = TaskItemsCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  required int hours,
  required int minutes,
  required int seconds,
  Value<bool> isRunning,
  Value<int> remainingTime,
  Value<DateTime?> currentTime,
});
typedef $$TaskItemsTableUpdateCompanionBuilder = TaskItemsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<int> hours,
  Value<int> minutes,
  Value<int> seconds,
  Value<bool> isRunning,
  Value<int> remainingTime,
  Value<DateTime?> currentTime,
});

class $$TaskItemsTableTableManager extends RootTableManager<
    _$TaskDatabase,
    $TaskItemsTable,
    TaskData,
    $$TaskItemsTableFilterComposer,
    $$TaskItemsTableOrderingComposer,
    $$TaskItemsTableProcessedTableManager,
    $$TaskItemsTableInsertCompanionBuilder,
    $$TaskItemsTableUpdateCompanionBuilder> {
  $$TaskItemsTableTableManager(_$TaskDatabase db, $TaskItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TaskItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TaskItemsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TaskItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> hours = const Value.absent(),
            Value<int> minutes = const Value.absent(),
            Value<int> seconds = const Value.absent(),
            Value<bool> isRunning = const Value.absent(),
            Value<int> remainingTime = const Value.absent(),
            Value<DateTime?> currentTime = const Value.absent(),
          }) =>
              TaskItemsCompanion(
            id: id,
            title: title,
            description: description,
            hours: hours,
            minutes: minutes,
            seconds: seconds,
            isRunning: isRunning,
            remainingTime: remainingTime,
            currentTime: currentTime,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            required int hours,
            required int minutes,
            required int seconds,
            Value<bool> isRunning = const Value.absent(),
            Value<int> remainingTime = const Value.absent(),
            Value<DateTime?> currentTime = const Value.absent(),
          }) =>
              TaskItemsCompanion.insert(
            id: id,
            title: title,
            description: description,
            hours: hours,
            minutes: minutes,
            seconds: seconds,
            isRunning: isRunning,
            remainingTime: remainingTime,
            currentTime: currentTime,
          ),
        ));
}

class $$TaskItemsTableProcessedTableManager extends ProcessedTableManager<
    _$TaskDatabase,
    $TaskItemsTable,
    TaskData,
    $$TaskItemsTableFilterComposer,
    $$TaskItemsTableOrderingComposer,
    $$TaskItemsTableProcessedTableManager,
    $$TaskItemsTableInsertCompanionBuilder,
    $$TaskItemsTableUpdateCompanionBuilder> {
  $$TaskItemsTableProcessedTableManager(super.$state);
}

class $$TaskItemsTableFilterComposer
    extends FilterComposer<_$TaskDatabase, $TaskItemsTable> {
  $$TaskItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get hours => $state.composableBuilder(
      column: $state.table.hours,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get minutes => $state.composableBuilder(
      column: $state.table.minutes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get seconds => $state.composableBuilder(
      column: $state.table.seconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isRunning => $state.composableBuilder(
      column: $state.table.isRunning,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get remainingTime => $state.composableBuilder(
      column: $state.table.remainingTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get currentTime => $state.composableBuilder(
      column: $state.table.currentTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskItemsTableOrderingComposer
    extends OrderingComposer<_$TaskDatabase, $TaskItemsTable> {
  $$TaskItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get hours => $state.composableBuilder(
      column: $state.table.hours,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get minutes => $state.composableBuilder(
      column: $state.table.minutes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get seconds => $state.composableBuilder(
      column: $state.table.seconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isRunning => $state.composableBuilder(
      column: $state.table.isRunning,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get remainingTime => $state.composableBuilder(
      column: $state.table.remainingTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get currentTime => $state.composableBuilder(
      column: $state.table.currentTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$TaskDatabaseManager {
  final _$TaskDatabase _db;
  _$TaskDatabaseManager(this._db);
  $$TaskItemsTableTableManager get taskItems =>
      $$TaskItemsTableTableManager(_db, _db.taskItems);
}
