import 'package:mobx/mobx.dart';

part 'task.g.dart';

class TaskModel = _TaskModel with _$TaskModel;

abstract class _TaskModel with Store {
  final String title;
  final String description;
  final int hours, minutes, seconds;

  @observable
  bool isRunning;

  @observable
  int remainingTime;

  @observable
  DateTime? currentTime;

  _TaskModel(
      {this.remainingTime = 0,
      this.currentTime,
      this.isRunning = true,
      required this.title,
      required this.description,
      required this.hours,
      required this.minutes,
      required this.seconds});
}
