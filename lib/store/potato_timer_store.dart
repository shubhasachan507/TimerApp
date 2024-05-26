import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';
import 'package:potatotimer/utils/extension.dart';

import '../index.dart';

class PotatoTimerStore with Store {
  @observable
  ObservableList<Task> taskList = ObservableList<Task>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _timer;
  int _initialTimerDuration = 0;
  DateTime? _initialTime;

  @action
  void addTask(
      String title, String description, int hours, int minutes, int seconds) {
    taskList.add(Task(
        title: title,
        description: description,
        hours: hours,
        minutes: minutes,
        seconds: seconds));
  }

  @action
  void removeTask(Task task) {
    taskList.remove(task);
  }

  @action
  void startTimer(
    Task task,
  ) {
    _initialTime = DateTime(0, 0, 0, task.hours, task.minutes, task.seconds);
    task.currentTime = _initialTime;
    _initialTimerDuration =
        task.hours * 3600 + task.minutes * 60 + task.seconds;
    task.remainingTime = _initialTimerDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (task.isRunning) {
        runInAction(() {
          if (task.remainingTime > 0) {
            task.remainingTime--;
            task.currentTime =
                task.currentTime!.subtract(const Duration(seconds: 1));
          } else {
            _playSound();
            _timer?.cancel();
          }
        });
      }
    });
  }

  @action
  Future<void> pauseTimer(Task task) async {
    runInAction(() {
      task.isRunning = false;
    });
  }

  @action
  Future<void> playTimer(Task task) async {
    runInAction(() {
      task.isRunning = true;
    });
  }

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource('song.mp3'), volume: 50);
  }

  Future<void> stopSound() async {
    await _audioPlayer.stop();
  }

  String currentDisplayTime(Task task) {
    return "${task.currentTime!.hour.formatTime()}:${task.currentTime!.minute.formatTime()}:${task.currentTime!.second.formatTime()}";
  }

  @action
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
  }
}
