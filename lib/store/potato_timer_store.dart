import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:drift/drift.dart';
import 'package:mobx/mobx.dart';
import 'package:potatotimer/utils/extension.dart';

import '../index.dart';

class PotatoTimerStore with Store {
  final TaskDatabase database;

  PotatoTimerStore(this.database) {
    fetchTasks();
  }

  @observable
  Observable<ObservableList<TaskData>> taskList =
      Observable(ObservableList<TaskData>());
  final _audioPlayer = AudioPlayer();
  Timer? _timer;

  @action
  Future fetchTasks() async {
    final allTasks = await database.allTasks;
    runInAction(() {
      taskList.value = ObservableList.of(sort(allTasks));
    });
  }

  @action
  List<TaskData> sort(List<TaskData> tasks) {
    tasks.sort((a, b) {
      if (a.remainingTime == 0 && b.remainingTime != 0) {
        return -1;
      } else if (a.remainingTime != 0 && b.remainingTime == 0) {
        return 1;
      } else {
        return 0;
      }
    });
    return tasks;
  }

  @action
  Future addTask(String title, String description, int hours, int minutes,
      int seconds) async {
    final newtask = TaskItemsCompanion(
      title: Value(title),
      description: Value(description),
      hours: Value(hours),
      minutes: Value(minutes),
      seconds: Value(seconds),
      currentTime: Value(DateTime(0, 0, 0, hours, minutes, seconds)),
      remainingTime: Value(hours * 3600 + minutes * 60 + seconds),
    );
    await database.insertTaskItem(newtask);
    fetchTasks();
  }

  @action
  Future removeTask(TaskData task) async {
    await database.deleteTask(task);
    fetchTasks();
  }

  @action
  Future updateTask(TaskData task) async {
    await database.updateTask(task);
    fetchTasks();
  }

  @action
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      for (var task in taskList.value) {
        if (task.isRunning) {
          if (task.remainingTime > 0) {
            task = task.copyWith(
                isRunning: task.isRunning,
                remainingTime: task.remainingTime - 1,
                currentTime: Value(
                    task.currentTime!.subtract(const Duration(seconds: 1))));
            updateTask(task);
          } else {
            _playSound();
          }
        }
      }
    });
  }

  @action
  Future<void> pauseTimer(TaskData task) async {
    task = task.copyWith(isRunning: false);
    updateTask(task);
  }

  @action
  Future<void> playTimer(TaskData task) async {
    task = task.copyWith(isRunning: true);
    updateTask(task);
  }

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource('song/song.mp3'), volume: 50);
  }

  Future<void> stopSound() async {
    await _audioPlayer.stop();
  }

  String currentDisplayTime(TaskData task) {
    return "${task.currentTime!.hour.formatTime()}:${task.currentTime!.minute.formatTime()}:${task.currentTime!.second.formatTime()}";
  }

  @action
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
  }
}
