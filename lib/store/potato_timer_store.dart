import 'package:mobx/mobx.dart';

import '../index.dart';

class PotatoTimerStore with Store {
  @observable
  ObservableList<Task> taskList = ObservableList<Task>();

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
}
