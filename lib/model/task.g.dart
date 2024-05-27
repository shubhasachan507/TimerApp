// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskModel on _TaskModel, Store {
  late final _$isRunningAtom =
      Atom(name: '_TaskModel.isRunning', context: context);

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  late final _$remainingTimeAtom =
      Atom(name: '_TaskModel.remainingTime', context: context);

  @override
  int get remainingTime {
    _$remainingTimeAtom.reportRead();
    return super.remainingTime;
  }

  @override
  set remainingTime(int value) {
    _$remainingTimeAtom.reportWrite(value, super.remainingTime, () {
      super.remainingTime = value;
    });
  }

  late final _$currentTimeAtom =
      Atom(name: '_TaskModel.currentTime', context: context);

  @override
  DateTime? get currentTime {
    _$currentTimeAtom.reportRead();
    return super.currentTime;
  }

  @override
  set currentTime(DateTime? value) {
    _$currentTimeAtom.reportWrite(value, super.currentTime, () {
      super.currentTime = value;
    });
  }

  @override
  String toString() {
    return '''
isRunning: ${isRunning},
remainingTime: ${remainingTime},
currentTime: ${currentTime}
    ''';
  }
}
